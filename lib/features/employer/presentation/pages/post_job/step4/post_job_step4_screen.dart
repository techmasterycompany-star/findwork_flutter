import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/widgets/post_job_input_field.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/widgets/post_job_logo_upload.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/widgets/post_job_step4_bottom_bar.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/widgets/post_job_stepper.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/widgets/post_job_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobStep4Screen extends StatefulWidget {
  const PostJobStep4Screen({super.key});

  @override
  State<PostJobStep4Screen> createState() => _PostJobStep4ScreenState();
}

class _PostJobStep4ScreenState extends State<PostJobStep4Screen> {
  late final TextEditingController _companyNameController;
  late final TextEditingController _websiteController;
  late final TextEditingController _companySizeController;
  late final TextEditingController _industryController;
  late final TextEditingController _aboutController;
  late final TextEditingController _linkedinController;
  late final TextEditingController _twitterController;

  @override
  void initState() {
    super.initState();
    _companyNameController = TextEditingController(text: 'TechCorp Solutions');
    _websiteController = TextEditingController(text: 'https://techcorpsolutions.com');
    _companySizeController = TextEditingController(text: '51-250 Employees');
    _industryController = TextEditingController(text: 'Technology & Software');
    _aboutController = TextEditingController(
      text:
          'TechCorp is a fast-growing software suite focused on giving modern companies high-performing collaboration tools. We promote inclusive culture, open development cycles, and deep professional development support.',
    );
    _linkedinController = TextEditingController(text: 'https://linkedin.com/company/techcorpsolutions');
    _twitterController = TextEditingController(text: 'https://linkedin.com/company/techcorpsolutions');
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _websiteController.dispose();
    _companySizeController.dispose();
    _industryController.dispose();
    _aboutController.dispose();
    _linkedinController.dispose();
    _twitterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: AppColors.primary600,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.work_outline_rounded,
                color: AppColors.white,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 8.w),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: const [
                  TextSpan(
                    text: 'Job',
                    style: TextStyle(color: AppColors.neutral900),
                  ),
                  TextSpan(
                    text: '4U',
                    style: TextStyle(color: AppColors.primary600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PostJobStepper(currentStep: 4),
                    SizedBox(height: 24.h),
                    Text(
                      'Step 4: Company Information',
                      style: AppTypography.h2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Highlight your company culture, logo, and links to build trust and attract applicants.',
                      style: AppTypography.body.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    PostJobInputField(
                      label: 'Company Name',
                      hintText: 'Enter company name',
                      controller: _companyNameController,
                      isRequired: true,
                    ),
                    SizedBox(height: 20.h),
                    const PostJobLogoUpload(),
                    SizedBox(height: 20.h),
                    PostJobInputField(
                      label: 'Company Website URL',
                      hintText: 'https://example.com',
                      controller: _websiteController,
                      isRequired: true,
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 20.h),
                    PostJobInputField(
                      label: 'Company Size',
                      hintText: 'Select company size',
                      controller: _companySizeController,
                      isRequired: true,
                    ),
                    SizedBox(height: 20.h),
                    PostJobInputField(
                      label: 'Industry',
                      hintText: 'Select industry',
                      controller: _industryController,
                      isRequired: true,
                    ),
                    SizedBox(height: 20.h),
                    PostJobTextArea(
                      label: 'About the Company',
                      hintText: 'Describe your company...',
                      controller: _aboutController,
                      isRequired: true,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'Social Media Profiles',
                      style: AppTypography.cardTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    PostJobInputField(
                      label: 'LinkedIn URL',
                      hintText: 'https://linkedin.com/company/...',
                      controller: _linkedinController,
                      suffixIcon: Icon(
                        Icons.link_rounded,
                        color: AppColors.neutral500,
                        size: 20.sp,
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 16.h),
                    PostJobInputField(
                      label: 'Twitter URL',
                      hintText: 'https://twitter.com/...',
                      controller: _twitterController,
                      suffixIcon: Icon(
                        Icons.alternate_email_rounded,
                        color: AppColors.neutral500,
                        size: 20.sp,
                      ),
                      keyboardType: TextInputType.url,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            const PostJobStep4BottomBar(),
          ],
        ),
      ),
    );
  }
}
