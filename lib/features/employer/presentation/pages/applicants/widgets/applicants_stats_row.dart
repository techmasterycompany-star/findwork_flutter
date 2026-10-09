import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantsStatsRow extends StatelessWidget {
  final int total;
  final int newCount;
  final int shortlisted;
  final int interviews;

  const ApplicantsStatsRow({
    Key? key,
    required this.total,
    required this.newCount,
    required this.shortlisted,
    required this.interviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatChip(label: 'Total', count: total, color: AppColors.neutral600),
        SizedBox(width: 8.w),
        StatChip(label: 'New', count: newCount, color: AppColors.primary600),
        SizedBox(width: 8.w),
        StatChip(label: 'Shortlisted', count: shortlisted, color: AppColors.success600),
        SizedBox(width: 8.w),
        StatChip(label: 'Interviews', count: interviews, color: const Color(0xFF1D6FA4)),
      ],
    );
  }
}

class StatChip extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const StatChip({
    Key? key,
    required this.label,
    required this.count,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count.toString(),
          style: AppTypography.h3.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        Text(
          label,
          style: AppTypography.caption.copyWith(
            color: AppColors.neutral500,
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
