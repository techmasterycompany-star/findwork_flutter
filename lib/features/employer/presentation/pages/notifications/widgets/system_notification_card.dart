import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SystemNotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isNew;

  const SystemNotificationCard({
    super.key,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.isNew = false,
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
          // System icon
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              color: AppColors.primary100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_active_rounded,
              color: AppColors.primary600,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.neutral900,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  message,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral600,
                    height: 1.5,
                  ),
                ),
                if (actionLabel != null) ...[
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: actionLabel!,
                    variant: CustomButtonVariant.primary,
                    height: 36.h,
                    fontSize: 12.sp,
                    onPressed: onAction ?? () {},
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
