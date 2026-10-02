import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobSkillChip extends StatelessWidget {
  final String label;
  final VoidCallback onDeleted;

  const PostJobSkillChip({
    super.key,
    required this.label,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTypography.smallText.copyWith(
              color: AppColors.primary600,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(width: 6.w),
          GestureDetector(
            onTap: onDeleted,
            child: Icon(
              Icons.cancel_outlined,
              size: 14.sp,
              color: AppColors.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
