import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String avatarInitials;
  final Color avatarColor;
  final String message;
  final String timeAgo;
  final bool isNew;
  final VoidCallback onViewApplication;

  const NotificationCard({
    super.key,
    required this.avatarInitials,
    required this.avatarColor,
    required this.message,
    required this.timeAgo,
    this.isNew = false,
    required this.onViewApplication,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isNew ? AppColors.primary200 : AppColors.neutral200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot indicator
          Padding(
            padding: EdgeInsets.only(top: 6.h, right: 10.w),
            child: Container(
              width: 8.r,
              height: 8.r,
              decoration: BoxDecoration(
                color: isNew ? AppColors.primary600 : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Avatar
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: avatarColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                avatarInitials,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.neutral800,
                    fontSize: 13.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  timeAgo,
                  style: AppTypography.caption.copyWith(
                    color: isNew ? AppColors.primary600 : AppColors.neutral400,
                    fontWeight:
                        isNew ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  text: 'View Application',
                  variant: CustomButtonVariant.primary,
                  height: 36.h,
                  fontSize: 12.sp,
                  onPressed: onViewApplication,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
