import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobBottomBar extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onContinue;

  const PostJobBottomBar({
    super.key,
    this.onCancel,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.neutral200, width: 1.h),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.neutral700,
                side: const BorderSide(color: AppColors.neutral200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
              child: Text(
                'Cancel',
                style: AppTypography.smallText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral700,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: onContinue,
              icon: const SizedBox.shrink(),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: AppTypography.smallText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.chevron_right_rounded, size: 18.sp, color: AppColors.white),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary600,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
