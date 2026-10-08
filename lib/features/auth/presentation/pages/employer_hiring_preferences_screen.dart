import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/appbar.dart';
import '../widgets/user_steps.dart';

class EmployerHiringPreferencesScreen extends StatefulWidget {
  final Map<String, dynamic> companyData;

  const EmployerHiringPreferencesScreen({super.key, required this.companyData});

  @override
  State<EmployerHiringPreferencesScreen> createState() =>
      _EmployerHiringPreferencesScreenState();
}

class _EmployerHiringPreferencesScreenState
    extends State<EmployerHiringPreferencesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _jobCategoriesController = TextEditingController();
  final _preferredExperienceController = TextEditingController();
  final _budgetMinController = TextEditingController();
  final _budgetMaxController = TextEditingController();
  final _hiringTimelineController = TextEditingController();

  final List<String> _jobCategories = [
    'Software Development',
    'Design',
    'Marketing',
    'Sales',
    'Finance',
    'HR',
    'Operations',
    'Customer Support',
    'Data Science',
    'DevOps',
    'Product Management',
    'Quality Assurance',
    'Mobile Development',
    'Web Development',
  ];
  final List<String> _experienceLevels = [
    'Intern',
    'Junior',
    'Mid-level',
    'Senior',
    'Lead',
    'Principal',
    'Executive',
  ];
  final List<String> _timelines = [
    'Immediate (within 1 week)',
    '1-2 weeks',
    '2-4 weeks',
    '1-2 months',
    '2-3 months',
    '3+ months',
  ];

  @override
  void dispose() {
    _jobCategoriesController.dispose();
    _preferredExperienceController.dispose();
    _budgetMinController.dispose();
    _budgetMaxController.dispose();
    _hiringTimelineController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  void _onContinue() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final hiringData = {
      ...widget.companyData,
      'jobCategories': _jobCategoriesController.text.trim(),
      'preferredExperience': _preferredExperienceController.text.trim(),
      'budgetMin': _budgetMinController.text.trim(),
      'budgetMax': _budgetMaxController.text.trim(),
      'hiringTimeline': _hiringTimelineController.text.trim(),
    };
    context.go('/register/employer/review', extra: hiringData);
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
                UserSteps(message: 'Profile Information', currentStep: 2),
                _buildProgressIndicator(2),
                AppSpacing.vertical32,
                _buildJobCategoriesField(),
                _buildExperienceDropdown(),
                _buildBudgetRangeFields(),
                _buildHiringTimelineDropdown(),
                AppSpacing.vertical24,

                _buildNavigationButtons(),
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

  Widget _buildJobCategoriesField() {
    return AuthTextFormField(
      controller: _jobCategoriesController,
      hintText: 'e.g., Software Development, Design, Marketing',
      labelText: 'Job Categories (comma separated)',
      prefixIcon: Icons.category_outlined,
      textInputAction: TextInputAction.next,
      validator: (v) => _validateRequired(v, 'Job Categories'),
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildExperienceDropdown() {
    return DropdownButtonFormField<String>(
      value: _preferredExperienceController.text.isEmpty
          ? null
          : _preferredExperienceController.text,
      decoration: InputDecoration(
        labelText: 'Preferred Experience Level',
        prefixIcon: Icon(
          Icons.work_history_outlined,
          color: AppColors.neutral400,
        ),
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
      items: _experienceLevels
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) =>
          setState(() => _preferredExperienceController.text = v ?? ''),
      validator: (v) => _validateRequired(v, 'Preferred Experience'),
    );
  }

  Widget _buildBudgetRangeFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hourly Budget Range',
          style: AppTypography.smallText.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.neutral700,
          ),
        ),
        AppSpacing.vertical8,
        Row(
          children: [
            Expanded(
              child: AuthTextFormField(
                controller: _budgetMinController,
                hintText: 'Min',
                labelText: 'Min Hourly Rate',
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (v) => _validateRequired(v, 'Min Rate'),
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
            AppSpacing.horizontal16,
            Expanded(
              child: AuthTextFormField(
                controller: _budgetMaxController,
                hintText: 'Max',
                labelText: 'Max Hourly Rate',
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (v) => _validateRequired(v, 'Max Rate'),
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHiringTimelineDropdown() {
    return DropdownButtonFormField<String>(
      value: _hiringTimelineController.text.isEmpty
          ? null
          : _hiringTimelineController.text,
      decoration: InputDecoration(
        labelText: 'Hiring Timeline',
        prefixIcon: Icon(Icons.schedule_outlined, color: AppColors.neutral400),
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
      items: _timelines
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) =>
          setState(() => _hiringTimelineController.text = v ?? ''),
      validator: (v) => _validateRequired(v, 'Hiring Timeline'),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      spacing: AppSpacing.cardGapSmall,
      children: [
        OutlinedButton(
          onPressed: () => context.go(
            '/register/employer/company-info',
            extra: widget.companyData,
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            ),
            side: BorderSide(color: AppColors.neutral300),
          ),
          child: Text(
            'Back',
            style: AppTypography.body.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral700,
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: _onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary600,
              foregroundColor: AppColors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(vertical: 16.h),
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
