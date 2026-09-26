import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/post_job_bottom_bar.dart';
import 'widgets/post_job_dropdown.dart';
import 'widgets/post_job_remote_checkbox.dart';
import 'widgets/post_job_stepper.dart';
import 'widgets/post_job_text_field.dart';
import 'widgets/post_job_type_option.dart';

class PostJobStep1Screen extends StatefulWidget {
  const PostJobStep1Screen({super.key});

  @override
  State<PostJobStep1Screen> createState() => PostJobStep1ScreenState();
}

class PostJobStep1ScreenState extends State<PostJobStep1Screen> {
  final TextEditingController jobTitleController = TextEditingController(
    text: 'Senior Product Designer',
  );
  final TextEditingController vacanciesController = TextEditingController(
    text: '2',
  );
  final TextEditingController locationController = TextEditingController(
    text: 'New York, NY',
  );

  String selectedJobType = 'Full-Time';
  bool isRemote = false;

  static const List<String> jobTypes = [
    'Full-Time',
    'Internship',
    'Part-Time',
    'Contract Base',
  ];

  @override
  void dispose() {
    jobTitleController.dispose();
    vacanciesController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.neutral50,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.neutral700, size: 22.sp),
          onPressed: () => context.pop(),
        ),
        titleSpacing: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 32.h,
          errorBuilder: (_, e, stack) => Text(
            'Job4U',
            style: AppTypography.cardTitle.copyWith(
              color: AppColors.primary600,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            color: AppColors.white,
            child: const PostJobStepper(currentStep: 1),
          ),
          const Divider(color: AppColors.neutral200, height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 1: Job Details',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.neutral900,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Provide basic information about the role to help target the right candidates.',
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral500,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PostJobTextField(
                    label: 'Job Title',
                    hintText: 'Senior Product Designer',
                    controller: jobTitleController,
                  ),
                  SizedBox(height: 16.h),
                  PostJobDropdown(
                    label: 'Job Category',
                    value: 'Design & Creative',
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  PostJobDropdown(
                    label: 'Experience Level',
                    value: 'Mid-Senior Level (3-5 years)',
                    onTap: () {},
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Text(
                        'Job Type',
                        style: AppTypography.smallText.copyWith(
                          color: AppColors.neutral900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' *',
                        style: AppTypography.smallText.copyWith(
                          color: AppColors.error500,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: jobTypes.map((type) {
                      return PostJobTypeOption(
                        label: type,
                        isSelected: selectedJobType == type,
                        onTap: () => setState(() => selectedJobType = type),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.h),
                  PostJobTextField(
                    label: 'Number of Vacancies',
                    hintText: '2',
                    controller: vacanciesController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),
                  PostJobTextField(
                    label: 'Job Location',
                    hintText: 'New York, NY',
                    controller: locationController,
                    helperText: 'Enter city, state or remote options',
                  ),
                  SizedBox(height: 16.h),
                  PostJobRemoteCheckbox(
                    isChecked: isRemote,
                    onChanged: (val) => setState(() => isRemote = val),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          PostJobBottomBar(
            onCancel: () => context.pop(),
            onContinue: () => context.push('/PostJobStep2'),
          ),
        ],
      ),
    );
  }
}
