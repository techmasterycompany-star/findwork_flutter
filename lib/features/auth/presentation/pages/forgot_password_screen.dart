import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_bloc.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final UserType? initialUserType;

  const ForgotPasswordScreen({super.key, this.initialUserType});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  late UserType _selectedUserType;

  @override
  void initState() {
    super.initState();
    _selectedUserType = widget.initialUserType ?? UserType.candidate;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void _handleForgotPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = ForgotPasswordRequest(
        email: _emailController.text.trim(),
        userType: _selectedUserType,
      );
      context.read<AuthCubit>().forgotPassword(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthForgotPasswordSent) {
          context.go('/reset-password', extra: {
            'email': _emailController.text.trim(),
            'userType': _selectedUserType,
          });
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.error600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
            onPressed: () => context.go('/login', extra: _selectedUserType.name),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSpacing.vertical8,
                  _buildHeader(),
                  AppSpacing.vertical40,
                  _buildUserTypeSelector(),
                  AppSpacing.vertical32,
                  _buildEmailField(),
                  AppSpacing.vertical32,
                  _buildSubmitButton(),
                  AppSpacing.vertical32,
                  _buildBackToLogin(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
          ),
          child: Icon(
            Icons.lock_reset,
            size: 40.sp,
            color: AppColors.primary600,
          ),
        ),
        AppSpacing.vertical24,
        Text(
          'Forgot Password?',
          style: AppTypography.h2.copyWith(fontSize: 28.sp),
        ),
        AppSpacing.vertical8,
        Text(
          'Enter your email and we\'ll send you a reset link',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    );
  }

  Widget _buildUserTypeSelector() {
    return UserTypePillSelector(
      selectedType: _selectedUserType,
      onChanged: (type) {
        setState(() {
          _selectedUserType = type;
        });
      },
    );
  }

  Widget _buildEmailField() {
    return AuthTextFormField(
      controller: _emailController,
      hintText: 'Enter your email',
      labelText: 'Email',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      validator: _validateEmail,
      onFieldSubmitted: (_) => _handleForgotPassword(),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return SizedBox(
          height: 56.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : _handleForgotPassword,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary600,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                    ),
                  )
                : Text(
                    'Send Reset Link',
                    style: AppTypography.body.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildBackToLogin() {
    return AuthRichText(
      text: 'Remember your password?',
      actionText: 'Back to Sign In',
      onTap: () => context.go('/login', extra: _selectedUserType.name),
    );
  }
}