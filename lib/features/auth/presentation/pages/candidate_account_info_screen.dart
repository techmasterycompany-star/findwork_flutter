import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/appbar.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CandidateAccountInfoScreen extends StatefulWidget {
  const CandidateAccountInfoScreen({super.key});

  @override
  State<CandidateAccountInfoScreen> createState() =>
      _CandidateAccountInfoScreenState();
}

class _CandidateAccountInfoScreenState
    extends State<CandidateAccountInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'Full name is required';
    if (value.trim().length < 2) return 'Name must be at least 2 characters';
    return null;
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
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(value))
      return 'Must contain uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(value))
      return 'Must contain lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Must contain a number';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }

  void _onContinue() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final accountData = {
      'fullName': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'password': _passwordController.text,
      'userType': 'candidate',
    };
    context.go('/register/candidate/profile-info', extra: accountData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: MyAppbar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: AppSpacing.cardGapSmall,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserSteps(message: 'Account Information', currentStep: 1),
                _buildProgressIndicator(1),
                AppSpacing.vertical32,
                _buildNameField(),
                _buildEmailField(),
                _buildPasswordField(),
                _buildConfirmPasswordField(),
                AppSpacing.vertical24,

                _buildContinueButton(),
                AppSpacing.vertical24,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(int currentStep) {
    return Row(
      children: List.generate(3, (index) {
        final step = index + 1;
        final isActive = step <= currentStep;
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary600
                        : AppColors.neutral200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              if (index < 2) AppSpacing.horizontal8,
            ],
          ),
        );
      }),
    );
  }

  Widget _buildNameField() {
    return AuthTextFormField(
      controller: _nameController,
      hintText: 'Enter your full name',
      labelText: 'Full Name',
      prefixIcon: Icons.person_outline,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: _validateName,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildEmailField() {
    return AuthTextFormField(
      controller: _emailController,
      hintText: 'Enter your email',
      labelText: 'Email Address',
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
      hintText: 'Create a password',
      labelText: 'Password',
      validator: _validatePassword,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildConfirmPasswordField() {
    return AuthPasswordField(
      controller: _confirmPasswordController,
      hintText: 'Confirm your password',
      labelText: 'Confirm Password',
      validator: _validateConfirmPassword,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) => _onContinue(),
    );
  }

  Widget _buildContinueButton() {
    return Row(
      children: [
        TextButton(child: Text('Back'), onPressed: () => context.go('/login')),
        Expanded(
          child: ElevatedButton(
            onPressed: _onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary600,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
            ),
            child: Text(
              'Continue',
              style: AppTypography.body.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
