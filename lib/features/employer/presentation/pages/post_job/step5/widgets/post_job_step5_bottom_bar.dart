import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PostJobStep5BottomBar extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onPostJob;

  const PostJobStep5BottomBar({
    super.key,
    this.onBack,
    this.onPostJob,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.neutral200,
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: onBack ?? () => context.pop(),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: const BorderSide(color: AppColors.neutral300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Back',
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
            child: ElevatedButton(
              onPressed: onPostJob ?? () => context.push('/HomepageEmployer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary600,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Post a Job',
                style: AppTypography.smallText.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
