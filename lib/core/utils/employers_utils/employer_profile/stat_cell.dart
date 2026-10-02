import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCell extends StatelessWidget {
  final String value;
  final String label;
  final Color? valueColor;
  final bool isFullWidth;

  const StatCell({
    super.key,
    required this.value,
    required this.label,
    this.valueColor,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: isFullWidth ? 20.h : 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTypography.h3.copyWith(
              color: valueColor ?? AppColors.neutral900,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTypography.smallText.copyWith(color: AppColors.neutral500),
          ),
        ],
      ),
    );
  }
}

class CellDivider extends StatelessWidget {
  const CellDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 1.w, height: 80.h, color: AppColors.neutral100);
  }
}
