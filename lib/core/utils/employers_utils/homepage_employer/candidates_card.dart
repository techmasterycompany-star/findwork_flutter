import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateCard extends StatelessWidget {
  final String name;
  final String title;
  final String matchPercentage;
  final String hourlyRate;
  final List<String> skills;
  final String initials;
  final void Function()? inviteToApply;
  final void Function()? viewProfile;

  const CandidateCard({
    super.key,
    required this.name,
    required this.title,
    required this.matchPercentage,
    required this.hourlyRate,
    required this.skills,
    required this.initials,
    required this.inviteToApply,
    required this.viewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.04),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundColor: AppColors.primary100,
                child: Text(
                  initials,
                  style: AppTypography.cardTitle.copyWith(
                    color: AppColors.primary600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.cardTitle.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      title,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  matchPercentage,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                hourlyRate,
                style: AppTypography.cardTitle.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          Wrap(
            spacing: 8.w,
            runSpacing: 6.h,
            children: skills
                .map(
                  (skill) => Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary50,
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: AppColors.primary100),
                    ),
                    child: Text(
                      skill,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primary700,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16.h),
          const Divider(color: AppColors.neutral200, height: 1),
          SizedBox(height: 16.h),

          Column(
            children: [
              CustomButton(
                text: 'Invite to Apply',
                variant: CustomButtonVariant.primary,
                height: 40.h,
                width: double.infinity,
                onPressed: inviteToApply,
              ),
              SizedBox(height: 8.h),
              CustomButton(
                text: 'View Profile',
                variant: CustomButtonVariant.outlined,
                height: 40.h,
                width: double.infinity,
                onPressed: viewProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}