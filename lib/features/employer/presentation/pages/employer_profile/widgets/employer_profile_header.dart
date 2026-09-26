import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
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
              const _VerifiedBadge(),
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
                child: _ActionButton(
                  label: 'Contact',
                  icon: Icons.mail_outline_rounded,
                  isPrimary: true,
                  onTap: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _ActionButton(
                  label: 'View job',
                  icon: Icons.work_outline_rounded,
                  isPrimary: false,
                  onTap: () {},
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

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.verified_user_outlined, size: 14.sp, color: AppColors.primary600),
          SizedBox(width: 4.w),
          Text(
            'Verified employer',
            style: AppTypography.caption.copyWith(
              color: AppColors.primary600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 16.sp),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary600 : AppColors.white,
          foregroundColor: isPrimary ? AppColors.white : AppColors.primary600,
          elevation: 0,
          side: isPrimary ? null : const BorderSide(color: AppColors.primary600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: AppTypography.smallText.copyWith(
            fontWeight: FontWeight.w600,
            color: isPrimary ? AppColors.white : AppColors.primary600,
          ),
        ),
      ),
    );
  }
}

