import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/review_set.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../widgets/appbar.dart';

class CandidateReviewScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const CandidateReviewScreen({super.key, required this.data});

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
          child: Column(
            spacing: AppSpacing.cardGapSmall,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserSteps(message: 'Review and Confirm', currentStep: 3),
              _buildProgressIndicator(3),
              AppSpacing.vertical32,
              ReviewSection(
                title: 'Account Details',
                items: [
                  ReviewItem(label: 'Full Name', value: data['fullName'] ?? ''),
                  ReviewItem(label: 'Email', value: data['email'] ?? ''),
                ],
              ),
              AppSpacing.vertical24,
              ReviewSection(
                title: 'Profile Details',
                items: [
                  ReviewItem(
                    label: 'Professional Headline',
                    value: data['headline'] ?? '',
                  ),
                  ReviewItem(label: 'Skills', value: data['skills'] ?? ''),
                  ReviewItem(
                    label: 'Years of Experience',
                    value: data['experience'] ?? '',
                  ),
                  ReviewItem(
                    label: 'Resume',
                    value: data['resume'] != null ? 'Uploaded' : 'Not provided',
                  ),
                ],
              ),
              // const Spacer(),
              _buildActionButtons(context),
              // AppSpacing.vertical24,
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
              context.go('/register/candidate/profile-info', extra: data),
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
