import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobReviewHeader extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  const PostJobReviewHeader({
    super.key,
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.cardTitle.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary600,
          ),
        ),
        OutlinedButton.icon(
          onPressed: onEdit,
          icon: Icon(
            Icons.edit_outlined,
            size: 14.sp,
            color: AppColors.primary600,
          ),
          label: Text(
            'Edit',
            style: AppTypography.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primary600,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            side: const BorderSide(color: AppColors.primary300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
