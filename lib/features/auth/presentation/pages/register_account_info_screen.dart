import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/appbar.dart';

class RegisterAccountInfoScreen extends StatefulWidget {
  final UserType? initialUserType;

  const RegisterAccountInfoScreen({super.key, this.initialUserType});

  @override
  State<RegisterAccountInfoScreen> createState() =>
      _RegisterAccountInfoScreenState();
}

class _RegisterAccountInfoScreenState extends State<RegisterAccountInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  late UserType _selectedUserType;
  bool _acceptTerms = false;

  @override
  void initState() {
    super.initState();
    _selectedUserType = widget.initialUserType ?? UserType.candidate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
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

  String? _validatePhone(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(value)) {
        return 'Enter a valid phone number';
      }
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
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
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Please accept the Terms of Service and Privacy Policy',
            ),
            backgroundColor: AppColors.error600,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            ),
          ),
        );
        return;
      }
      final accountData = {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text,
        'confirmPassword': _confirmPasswordController.text,
        'phone': _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        'userType': _selectedUserType,
        'acceptTerms': _acceptTerms,
      };
      context.go('/register/profile-info', extra: accountData);
    }
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppSpacing.vertical8,
                _buildHeader(context),
                AppSpacing.vertical40,
                _buildUserTypeSelector(),
                AppSpacing.vertical32,
                _buildNameField(),
                AppSpacing.vertical20,
                _buildEmailField(),
                AppSpacing.vertical20,
                _buildPhoneField(),
                AppSpacing.vertical20,
                _buildPasswordField(),
                AppSpacing.vertical20,
                _buildConfirmPasswordField(),
                AppSpacing.vertical24,
                _buildTermsCheckbox(),
                AppSpacing.vertical32,
                _buildContinueButton(),
                AppSpacing.vertical32,
                _buildSignInPrompt(),
                AppSpacing.vertical32,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: AppTypography.h2.copyWith(fontSize: 28.sp),
        ),
        AppSpacing.vertical8,

        Row(
          mainAxisAlignment: .spaceBetween,
          spacing: AppSpacing.cardGapSmall,
          children: [
            _buildSteps(context, '1', true),
            _buildSteps(context, '2', false),
            _buildSteps(context, '3', false),
          ],
        ),

        Row(
          mainAxisAlignment: .spaceBetween,

          spacing: AppSpacing.cardGapSmall,
          children: [Text('Account'), Text('Profile'), Text('Review')],
        ),
      ],
    );
  }

  Widget _buildSteps(BuildContext context, String number, bool isPage) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(AppSpacing.cardGapSmall),
      decoration: BoxDecoration(
        color: isPage ? colorTheme.primary : AppColors.gray200,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        number,
        style: textTheme.bodySmall?.copyWith(color: isPage ? colorTheme.onPrimary : AppColors.gray500),
      ),
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
      labelText: 'Email',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validateEmail,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildPhoneField() {
    return AuthTextFormField(
      controller: _phoneController,
      hintText: 'Enter your phone (optional)',
      labelText: 'Phone Number',
      prefixIcon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: _validatePhone,
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
      onFieldSubmitted: (_) => _handleContinue(),
    );
  }

  Widget _buildTermsCheckbox() {
    return AuthCheckbox(
      value: _acceptTerms,
      label: 'I agree to the Terms of Service and Privacy Policy',
      onChanged: (value) {
        setState(() {
          _acceptTerms = value ?? false;
        });
      },
    );
  }

  Widget _buildContinueButton() {
    return Row(

      children: [
        TextButton(
          child: Text('Back'),
          onPressed: () => context.go('/login'),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: _handleContinue,
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

  Widget _buildSignInPrompt() {
    return AuthRichText(
      text: 'Already have an account?',
      actionText: 'Sign In',
      onTap: () => context.go('/login', extra: _selectedUserType.name),
    );
  }
}
