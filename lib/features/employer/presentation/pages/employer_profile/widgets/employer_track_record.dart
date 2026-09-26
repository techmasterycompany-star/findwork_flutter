import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerTrackRecord extends StatelessWidget {
  const EmployerTrackRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.06),
            blurRadius: 12.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 20.h),
            child: Text(
              'Track Record',
              style: AppTypography.smallText.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.neutral400,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const Divider(color: AppColors.neutral100, height: 1),
          Row(
            children: [
              const Expanded(
                child: _StatCell(value: '48', label: 'Jobs posted'),
              ),
              _CellDivider(),
              const Expanded(
                child: _StatCell(value: '39', label: 'Jobs completed'),
              ),
            ],
          ),
          const Divider(color: AppColors.neutral100, height: 1),
          Row(
            children: [
              const Expanded(
                child: _StatCell(value: '\$284k', label: 'Total spent'),
              ),
              _CellDivider(),
              const Expanded(
                child: _StatCell(value: '81%', label: 'Hiring rate'),
              ),
            ],
          ),
          const Divider(color: AppColors.neutral100, height: 1),
          const _StatCell(
            value: '4.9 ★',
            label: 'Average rating',
            valueColor: AppColors.warning500,
            isFullWidth: true,
          ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  final String value;
  final String label;
  final Color? valueColor;
  final bool isFullWidth;

  const _StatCell({
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

class _CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1.w, height: 80.h, color: AppColors.neutral100);
  }
}

