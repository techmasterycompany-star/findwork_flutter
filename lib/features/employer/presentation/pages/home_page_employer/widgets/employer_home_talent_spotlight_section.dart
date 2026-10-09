import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeTalentSpotlightSection extends StatelessWidget {
  const EmployerHomeTalentSpotlightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary50,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Talent Spotlight',
            style: AppTypography.cardTitle.copyWith(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Vetted freelancers who recently marked themselves as "Available Immediately"',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
              height: 1.4,
            ),
          ),
          SizedBox(height: 20.h),

          Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28.r,
                      backgroundColor: AppColors.primary100,
                      child: Text(
                        'CZ',
                        style: AppTypography.cardTitle.copyWith(
                          color: AppColors.primary600,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Clara Zhang',
                                style: AppTypography.cardTitle.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                '\$110/hr',
                                style: AppTypography.cardTitle.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.success600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Product Manager',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primary600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                Text(
                  'Ex-Uber PM. Specialized in technical marketplace scale, machine learning model onboarding, and agile coaching.',
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.neutral600,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 14.h),

                Wrap(
                  spacing: 8.w,
                  runSpacing: 6.h,
                  children: ['Product Ops', 'Agile', 'SQL']
                      .map(
                        (tag) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary50,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            tag,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
