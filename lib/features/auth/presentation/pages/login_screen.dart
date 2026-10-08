import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_cubit.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_state.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/appbar.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  final UserType? initialUserType;

  const LoginScreen({super.key, this.initialUserType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late UserType _selectedUserType;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _selectedUserType = widget.initialUserType ?? UserType.candidate;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void _onLoginPressed() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final request = LoginRequest(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      userType: _selectedUserType,
      rememberMe: _rememberMe,
    );
    context.read<AuthCubit>().login(request);
  }

  void _onAuthStateChange(BuildContext context, AuthState state) {
    if (state is AuthAuthenticated) {
      final route = state.user.userType == UserType.employer
          ? '/HomepageEmployer'
          : '/CandidateProfile';
      if (context.mounted) {
        context.go(route);
      }
    } else if (state is AuthError) {
      if (context.mounted) {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: _onAuthStateChange,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppbar(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.cardGapLarge),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                _buildHeader(),
                AppSpacing.vertical32,
                _buildUserTypeSelector(),
                AppSpacing.vertical32,
                _buildEmailField(),
                AppSpacing.vertical32,
_buildPasswordField(),
                AppSpacing.vertical16,
                _buildRememberMeAndForgot(),
                AppSpacing.vertical24,
                _buildLoginButton(context),
                AppSpacing.vertical32,

                _buildSignUpPrompt(),
              ],
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
        Text('Welcome Back', style: AppTypography.h2.copyWith(fontSize: 28)),
        AppSpacing.vertical8,
        Text(
          'Sign in to your Job4U account',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    );
  }

  Widget _buildUserTypeSelector() {
    return UserTypePillSelector(
      selectedType: _selectedUserType,
      onChanged: (type) => setState(() => _selectedUserType = type),
    );
  }

  Widget _buildEmailField() {
    return AuthTextFormField(
      controller: _emailController,
      hintText: 'Enter your email',
      labelText: 'Email',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validateEmail,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildPasswordField() {
    return AuthPasswordField(
      controller: _passwordController,
      hintText: 'Enter your password',
      labelText: 'Password',
      validator: _validatePassword,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _onLoginPressed(),
    );
  }

  Widget _buildRememberMeAndForgot() {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (v) => setState(() => _rememberMe = v ?? false),
                activeColor: AppColors.primary600,
                checkColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                side: BorderSide(
                  color: _rememberMe ? AppColors.primary600 : AppColors.neutral300,
                  width: 1.5,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
              AppSpacing.horizontal8,
              Text(
                'Remember me',
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral700,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => context.go('/forgot-password', extra: _selectedUserType.name),
          child: Text(
            'Forgot Password?',
            style: AppTypography.smallText.copyWith(
              color: AppColors.primary600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final loading = state is AuthLoading;
        return SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: loading ? null : _onLoginPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorTheme.primary,
              foregroundColor: colorTheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
            child: loading
                ? SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                : Text(
                    'Sign In',
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

  Widget _buildDivider() {
    return const AuthDivider(text: 'Or continue with');
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        AuthSocialButton(
          label: 'Continue with Google',
          icon: Image.asset('asset/icons/icon1.svg', width: 20.w, height: 20.h),
          onPressed: () {},
        ),
        AppSpacing.vertical12,
        AuthSocialButton(
          label: 'Continue with Apple',
          icon: Icon(Icons.apple, size: 20.sp, color: AppColors.neutral700),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSignUpPrompt() {
    return AuthRichText(
      text: "Don't have an account?",
      actionText: 'Sign Up',
      onTap: () => context.go('/register/user-type'),
    );
  }
}
