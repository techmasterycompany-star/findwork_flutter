import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/review_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/user_steps.dart';

class EmployerReviewScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const EmployerReviewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          onPressed: () =>
              context.go('/register/employer/hiring-preferences', extra: data),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserSteps(message: 'Profile Information', currentStep: 3),
              _buildProgressIndicator(3),
              AppSpacing.vertical32,
              ReviewSection(
                title: 'Company Information',
                items: [
                  ReviewItem(
                    label: 'Company Name',
                    value: data['companyName'] ?? '',
                  ),
                  ReviewItem(
                    label: 'Company Email',
                    value: data['companyEmail'] ?? '',
                  ),
                  ReviewItem(label: 'Industry', value: data['industry'] ?? ''),
                  ReviewItem(
                    label: 'Company Size',
                    value: data['companySize'] ?? '',
                  ),
                  ReviewItem(
                    label: 'Website',
                    value: data['website'] ?? 'Not provided',
                  ),
                ],
              ),

              AppSpacing.vertical24,
              // AppSpacing.vertical24,
              ReviewSection(
                title: 'Hiring Preferences',
                items: [
                  ReviewItem(
                    label: 'Job Categories',
                    value: data['jobCategories'] ?? '',
                  ),
                  ReviewItem(
                    label: 'Preferred Experience',
                    value: data['preferredExperience'] ?? '',
                  ),
                  ReviewItem(
                    label: 'Hourly Budget',
                    value:
                        '\$${data['budgetMin'] ?? 0} - \$${data['budgetMax'] ?? 0}',
                  ),
                  ReviewItem(
                    label: 'Hiring Timeline',
                    value: data['hiringTimeline'] ?? '',
                  ),
                ],
              ),
              AppSpacing.vertical24,

              _buildActionButtons(context),
              AppSpacing.vertical24,
            ],
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

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      spacing: AppSpacing.cardGapSmall,
      children: [
        OutlinedButton(
          onPressed: () =>
              context.go('/register/employer/hiring-preferences', extra: data),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            ),
            side: BorderSide(color: AppColors.neutral300),
          ),
          child: Text(
            'Edit',
            style: AppTypography.body.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.neutral700,
            ),
          ),
        ),

        Expanded(
          child: ElevatedButton(
            onPressed: () => _submitRegistration(context),
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
              'Create Account',
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

  void _submitRegistration(BuildContext context) {
    context.go('/congratulation');
  }
}
