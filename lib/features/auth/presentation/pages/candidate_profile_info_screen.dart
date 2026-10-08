import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/appbar.dart';

class CandidateProfileInfoScreen extends StatefulWidget {
  final Map<String, dynamic> accountData;

  const CandidateProfileInfoScreen({super.key, required this.accountData});

  @override
  State<CandidateProfileInfoScreen> createState() =>
      _CandidateProfileInfoScreenState();
}

class _CandidateProfileInfoScreenState
    extends State<CandidateProfileInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _headlineController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();
  XFile? _resumeFile;

  @override
  void dispose() {
    _headlineController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  Future<void> _pickResume() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _resumeFile = XFile(picked.path));
    }
  }

  void _onContinue() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final profileData = {
      ...widget.accountData,
      'headline': _headlineController.text.trim(),
      'skills': _skillsController.text.trim(),
      'experience': _experienceController.text.trim(),
      'resume': _resumeFile?.path,
    };
    context.go('/register/candidate/review', extra: profileData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _buildHeadlineField(),
                _buildSkillsField(),
                _buildExperienceField(),
                _buildResumeUpload(),
                _buildContinueButton(),
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

  Widget _buildHeadlineField() {
    return AuthTextFormField(
      controller: _headlineController,
      hintText: 'e.g., Senior Flutter Developer | Mobile Expert',
      labelText: 'Professional Headline',
      prefixIcon: Icons.work_outline,
      textInputAction: TextInputAction.next,
      validator: (v) => _validateRequired(v, 'Professional Headline'),
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildSkillsField() {
    return AuthTextFormField(
      controller: _skillsController,
      hintText: 'e.g., Flutter, Dart, Firebase, REST APIs, Git',
      labelText: 'Skills (comma separated)',
      prefixIcon: Icons.star_outline,
      textInputAction: TextInputAction.next,
      validator: (v) => _validateRequired(v, 'Skills'),
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
    );
  }

  Widget _buildExperienceField() {
    return AuthTextFormField(
      controller: _experienceController,
      hintText: 'e.g., 5 years in mobile development...',
      labelText: 'Years of Experience',
      prefixIcon: Icons.timeline_outlined,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      validator: (v) => _validateRequired(v, 'Years of Experience'),
      onFieldSubmitted: (_) => _onContinue(),
    );
  }

  Widget _buildResumeUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Resume (PDF)',
          style: AppTypography.smallText.copyWith(
            color: AppColors.neutral700,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.vertical8,
        GestureDetector(
          onTap: _pickResume,
          child: Container(
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
              border: Border.all(color: AppColors.neutral200, width: 1),
              color: AppColors.neutral50,
            ),
            child: _resumeFile != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          size: 48.sp,
                          color: AppColors.primary600,
                        ),
                        AppSpacing.vertical8,
                        Text(
                          _resumeFile!.path.split('/').last,
                          style: AppTypography.body.copyWith(
                            color: AppColors.primary600,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_upload_outlined,
                        size: 32.sp,
                        color: AppColors.neutral400,
                      ),
                      AppSpacing.vertical8,
                      Text(
                        'Tap to upload resume',
                        style: AppTypography.body.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Row(
      children: [
        TextButton(
          child: Text('Back'),
          onPressed: () => context.go(
            '/register/candidate/account-info',
            extra: widget.accountData,
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
