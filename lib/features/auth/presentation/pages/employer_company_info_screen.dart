import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/appbar.dart';
import '../widgets/user_steps.dart';

class EmployerCompanyInfoScreen extends StatefulWidget {
  const EmployerCompanyInfoScreen({super.key});

  @override
  State<EmployerCompanyInfoScreen> createState() =>
      _EmployerCompanyInfoScreenState();
}

class _EmployerCompanyInfoScreenState extends State<EmployerCompanyInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _companyEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _industryController = TextEditingController();
  final _companySizeController = TextEditingController();
  final _websiteController = TextEditingController();

  final List<String> _industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Manufacturing',
    'Retail',
    'Real Estate',
    'Construction',
    'Transportation',
    'Energy',
    'Media & Entertainment',
    'Hospitality',
    'Legal',
    'Government',
    'Non-profit',
  ];
  final List<String> _companySizes = [
    '1-10',
    '11-50',
    '51-200',
    '201-500',
    '501-1000',
    '1000+',
  ];

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyEmailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _industryController.dispose();
    _companySizeController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) return '$fieldName is required';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Company email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain lowercase letter';
    }
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
      'companyName': _companyNameController.text.trim(),
      'companyEmail': _companyEmailController.text.trim(),
      'password': _passwordController.text,
      'industry': _industryController.text,
      'companySize': _companySizeController.text,
      'website': _websiteController.text.trim().isEmpty
          ? null
          : _websiteController.text.trim(),
      'userType': 'employer',
    };
    context.go('/register/employer/hiring-preferences', extra: accountData);
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
                _buildCompanyNameField(),
                _buildCompanyEmailField(),
                _buildPasswordField(),
                _buildConfirmPasswordField(),
                AppSpacing.horizontal24,
                _buildIndustryDropdown(),
                _buildCompanySizeDropdown(),
                _buildWebsiteField(),
                AppSpacing.vertical32,
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

  Widget _buildCompanyNameField() {
    return AuthTextFormField(
      controller: _companyNameController,
      hintText: 'Enter company name',
      labelText: 'Company Name',
      prefixIcon: Icons.business_outlined,
      textInputAction: TextInputAction.next,
      validator: (v) => _validateRequired(v, 'Company Name'),
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildCompanyEmailField() {
    return AuthTextFormField(
      controller: _companyEmailController,
      hintText: 'Enter company email',
      labelText: 'Company Email',
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
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildIndustryDropdown() {
    return DropdownButtonFormField<String>(
      value: _industryController.text.isEmpty ? null : _industryController.text,
      decoration: InputDecoration(
        labelText: 'Industry',
        prefixIcon: Icon(Icons.category_outlined, color: AppColors.neutral400),
        filled: true,
        fillColor: AppColors.neutral50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.neutral200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.neutral200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.primary600, width: 1.5),
        ),
      ),
      items: _industries
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) => setState(() => _industryController.text = v ?? ''),
      validator: (v) => _validateRequired(v, 'Industry'),
    );
  }

  Widget _buildCompanySizeDropdown() {
    return DropdownButtonFormField<String>(
      value: _companySizeController.text.isEmpty
          ? null
          : _companySizeController.text,
      decoration: InputDecoration(
        labelText: 'Company Size',
        prefixIcon: Icon(Icons.people_outline, color: AppColors.neutral400),
        filled: true,
        fillColor: AppColors.neutral50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.neutral200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.neutral200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          borderSide: BorderSide(color: AppColors.primary600, width: 1.5),
        ),
      ),
      items: _companySizes
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) => setState(() => _companySizeController.text = v ?? ''),
      validator: (v) => _validateRequired(v, 'Company Size'),
    );
  }

  Widget _buildWebsiteField() {
    return AuthTextFormField(
      controller: _websiteController,
      hintText: 'https://company.com',
      labelText: 'Company Website (optional)',
      prefixIcon: Icons.language_outlined,
      keyboardType: TextInputType.url,
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
