import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTypography.cardTitle.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: AppTypography.caption.copyWith(
              color: AppColors.primary200,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: 40.h,
      color: AppColors.primary400,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
    );
  }
}
