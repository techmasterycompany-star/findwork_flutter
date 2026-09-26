import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/proof_point_item.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeCtaBanner extends StatelessWidget {
  const EmployerHomeCtaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary600.withValues(alpha: 0.08),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kicker tag
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.primary200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.business_center_outlined,
                  size: 14.sp,
                  color: AppColors.primary600,
                ),
                SizedBox(width: 6.w),
                Text(
                  'Hire Top Talent',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Headline
          Text(
            'Find your next great hire, faster.',
            style: AppTypography.h3.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Post jobs, search candidates, and connect with top talent in minutes.',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),

          // Search Inputs
          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.neutral300),
            ),
            child: Row(
              children: [
                Icon(Icons.search_rounded,
                    size: 20.sp, color: AppColors.neutral400),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search candidates by skill, role...',
                      hintStyle: AppTypography.smallText.copyWith(
                        color: AppColors.neutral400,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),

          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.neutral300),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 20.sp, color: AppColors.neutral400),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Location (e.g. Remote, Copenhagen)',
                      hintStyle: AppTypography.smallText.copyWith(
                        color: AppColors.neutral400,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Find Talent Custom Button
          CustomButton(
            text: 'Find Talent',
            icon: Icons.search_rounded,
            variant: CustomButtonVariant.primary,
            height: 48.h,
            width: double.infinity,
            onPressed: () {},
          ),
          SizedBox(height: 20.h),

          // Proof points using public ProofPointItem
          Column(
            children: [
              ProofPointItem(text: 'Free forever'),
              SizedBox(height: 8.h),
              ProofPointItem(text: 'No credit card required'),
              SizedBox(height: 8.h),
              ProofPointItem(text: '500K+ active candidates'),
            ],
          ),
        ],
      ),
    );
  }
}
