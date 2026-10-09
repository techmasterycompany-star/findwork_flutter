import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/verified_badge.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerProfileHeader extends StatelessWidget {
  const EmployerProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.white,
                width: 3.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral900.withValues(alpha: 0.1),
                  blurRadius: 8.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Icon(
              Icons.business_rounded,
              color: AppColors.primary600,
              size: 40.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Employer profile',
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral500,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NorthStar Studio',
                style: AppTypography.cardTitle,
              ),
              SizedBox(width: 12.w),
              const VerifiedBadge(),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Product design & strategy studio • Independent since 2016',
            style: AppTypography.smallText,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16.sp, color: AppColors.neutral500),
              SizedBox(width: 6.w),
              Text('Copenhagen, Denmark', style: AppTypography.caption),
              SizedBox(width: 16.w),
              Icon(Icons.access_time_rounded, size: 16.sp, color: AppColors.neutral500),
              SizedBox(width: 6.w),
              Text('Member since 2019', style: AppTypography.caption),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.language_rounded, size: 16.sp, color: AppColors.neutral500),
              SizedBox(width: 6.w),
              Text(
                'northstar.studio',
                style: AppTypography.caption.copyWith(
                  color: AppColors.primary600,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Contact',
                  icon: Icons.mail_outline_rounded,
                  variant: CustomButtonVariant.primary,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomButton(
                  text: 'View job',
                  icon: Icons.work_outline_rounded,
                  variant: CustomButtonVariant.outlined,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral200),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.neutral500,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
