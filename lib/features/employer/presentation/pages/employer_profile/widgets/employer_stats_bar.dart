import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmployerStatsBar extends StatelessWidget {
  const EmployerStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _StatItem(value: '43', label: 'Jobs posted'),
          _VerticalDivider(),
          const _StatItem(value: '39', label: 'Hired'),
          _VerticalDivider(),
          const _StatItem(value: '\$234k', label: 'Total spent'),
          _VerticalDivider(),
          const _StatItem(value: '81%', label: 'Hire rate'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

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

class _VerticalDivider extends StatelessWidget {
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

