import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeJobCard extends StatelessWidget {
  final String postedTime;
  final String statusLabel;
  final Color statusColor;
  final Color statusBgColor;
  final String jobTitle;
  final String applicationsCount;
  final String viewsCount;
  final VoidCallback? onViewApplications;
  final VoidCallback? onMorePressed;

  const EmployerHomeJobCard({
    super.key,
    required this.postedTime,
    required this.statusLabel,
    required this.statusColor,
    required this.statusBgColor,
    required this.jobTitle,
    required this.applicationsCount,
    required this.viewsCount,
    this.onViewApplications,
    this.onMorePressed,
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
            color: AppColors.primary600.withValues(alpha: 0.06),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                postedTime,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral400,
                  fontSize: 11.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  statusLabel,
                  style: AppTypography.caption.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Job Title
          Text(
            jobTitle,
            style: AppTypography.cardTitle.copyWith(
              fontSize: 18.sp,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 12.h),

          // Stats row
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.people_outline_rounded,
                      size: 16.sp, color: AppColors.neutral500),
                  SizedBox(width: 6.w),
                  Text(
                    applicationsCount,
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20.w),
              Row(
                children: [
                  Icon(Icons.bar_chart_rounded,
                      size: 16.sp, color: AppColors.neutral500),
                  SizedBox(width: 6.w),
                  Text(
                    viewsCount,
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(color: AppColors.neutral200, height: 1),
          SizedBox(height: 16.h),

          // Buttons row using CustomButton
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'View Applications',
                  variant: CustomButtonVariant.primary,
                  height: 40.h,
                  onPressed: onViewApplications ?? () {},
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary600),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.primary600,
                    size: 22.sp,
                  ),
                  onPressed: onMorePressed ?? () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
