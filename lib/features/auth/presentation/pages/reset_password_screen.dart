import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/auth_request.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/business_logic/cubit/auth_bloc.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final UserType userType;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.userType,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != 6) {
      return 'OTP must be 6 digits';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'OTP must contain only numbers';
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleResetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = ResetPasswordRequest(
        email: widget.email,
        otp: _otpController.text,
        newPassword: _newPasswordController.text,
        confirmPassword: _confirmPasswordController.text,
        userType: widget.userType,
      );
      context.read<AuthCubit>().resetPassword(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthPasswordReset) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Password reset successful! Please sign in.'),
              backgroundColor: AppColors.success600,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
          );
          context.go('/login', extra: widget.userType.name);
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
            onPressed: () => context.go('/forgot-password', extra: widget.userType.name),
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
                  _buildOtpField(),
                  AppSpacing.vertical20,
                  _buildNewPasswordField(),
                  AppSpacing.vertical20,
                  _buildConfirmPasswordField(),
                  AppSpacing.vertical32,
                  _buildResetButton(),
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
            color: AppColors.success50,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
          ),
          child: Icon(
            Icons.lock_outline,
            size: 40.sp,
            color: AppColors.success600,
          ),
        ),
        AppSpacing.vertical24,
        Text(
          'Reset Password',
          style: AppTypography.h2.copyWith(fontSize: 28.sp),
        ),
        AppSpacing.vertical8,
        Text(
          'Enter the 6-digit code sent to ${_maskEmail(widget.email)}',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    );
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final name = parts[0];
    final domain = parts[1];
    if (name.length <= 2) return '$name@$domain';
    return '${name.substring(0, 2)}${'*' * (name.length - 2)}@$domain';
  }

  Widget _buildOtpField() {
    return AuthTextFormField(
      controller: _otpController,
      hintText: 'Enter 6-digit code',
      labelText: 'Verification Code',
      prefixIcon: Icons.pin_outlined,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      validator: _validateOtp,
      maxLength: 6,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildNewPasswordField() {
    return AuthPasswordField(
      controller: _newPasswordController,
      hintText: 'Create new password',
      labelText: 'New Password',
      validator: _validateNewPassword,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildConfirmPasswordField() {
    return AuthPasswordField(
      controller: _confirmPasswordController,
      hintText: 'Confirm new password',
      labelText: 'Confirm Password',
      validator: _validateConfirmPassword,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _handleResetPassword(),
    );
  }

  Widget _buildResetButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return SizedBox(
          height: 56.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : _handleResetPassword,
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
                    'Reset Password',
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
}