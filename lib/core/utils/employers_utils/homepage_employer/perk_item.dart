import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerkItem extends StatelessWidget {
  final String text;

  const PerkItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_rounded,
          size: 16.sp,
          color: AppColors.primary400,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: AppTypography.caption.copyWith(
            color: AppColors.neutral300,
          ),
        ),
      ],
    );
  }
}
