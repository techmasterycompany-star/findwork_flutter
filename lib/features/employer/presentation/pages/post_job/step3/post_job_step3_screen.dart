import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/post_job_benefit_checkbox.dart';
import 'widgets/post_job_input_field.dart';
import 'widgets/post_job_salary_period_option.dart';
import 'widgets/post_job_step3_bottom_bar.dart';
import 'widgets/post_job_stepper.dart';

class PostJobStep3Screen extends StatefulWidget {
  const PostJobStep3Screen({super.key});

  @override
  State<PostJobStep3Screen> createState() => PostJobStep3ScreenState();
}

class PostJobStep3ScreenState extends State<PostJobStep3Screen> {
  final TextEditingController salaryMinController = TextEditingController(
    text: '95,000',
  );
  final TextEditingController salaryMaxController = TextEditingController(
    text: '125,000',
  );
  final TextEditingController currencyController = TextEditingController(
    text: 'USD (\$)',
  );

  String selectedPeriod = 'Yearly';

  static const List<String> salaryPeriods = ['Yearly', 'Monthly', 'Hourly'];

  final Map<String, bool> benefits = {
    'Health Insurance': true,
    '401(k) Matching': true,
    'Hybrid Work Environment': true,
    'Dental & Vision Care': true,
    'Paid Time Off (PTO)': true,
    'Flexible Working Hours': true,
    'Professional Development': true,
    'Gym Membership / Wellness stipend': true,
    'Parental Leave': true,
  };

  @override
  void dispose() {
    salaryMinController.dispose();
    salaryMaxController.dispose();
    currencyController.dispose();
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
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.neutral700,
            size: 22.sp,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
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
            child: const PostJobStepper(currentStep: 3),
          ),
          const Divider(color: AppColors.neutral200, height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 3: Compensation & Benefits',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.neutral900,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Be transparent about salary ranges and the extra perks that make your workplace attractive.',
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral500,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PostJobInputField(
                    label: 'Salary Range (Minimum)',
                    hintText: '95,000',
                    controller: salaryMinController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),
                  PostJobInputField(
                    label: 'Salary Range (Maximum)',
                    hintText: '125,000',
                    controller: salaryMaxController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.h),
                  PostJobInputField(
                    label: 'Currency',
                    hintText: 'USD (\$)',
                    controller: currencyController,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Text(
                        'Salary Period',
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
                  SizedBox(height: 12.h),
                  Row(
                    children: salaryPeriods.map((period) {
                      return Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: PostJobSalaryPeriodOption(
                          label: period,
                          isSelected: selectedPeriod == period,
                          onTap: () =>
                              setState(() => selectedPeriod = period),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    'Offered Benefits',
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral900,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ...benefits.keys.map((benefit) {
                    return PostJobBenefitCheckbox(
                      label: benefit,
                      isChecked: benefits[benefit]!,
                      onChanged: (val) =>
                          setState(() => benefits[benefit] = val),
                    );
                  }),
                  SizedBox(height: 8.h),
                  Text(
                    'Select the key perks you provide',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral400,
                      fontSize: 11.sp,
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          PostJobStep3BottomBar(
            onBack: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/PostJobStep2');
              }
            },
            onContinue: () {
              context.push('/PostJobStep4');
            },
          ),
        ],
      ),
    );
  }
}
