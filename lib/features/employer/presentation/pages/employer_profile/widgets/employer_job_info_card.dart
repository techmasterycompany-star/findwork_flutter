import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerJobInfoCard extends StatelessWidget {
  const EmployerJobInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      padding: EdgeInsets.all(24.w),
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
          Text(
            '[ Proof Point ]',
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral400,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Why work with them',
            style: AppTypography.cardTitle,
          ),
          SizedBox(height: 12.h),
          // Rating row
          Row(
            children: [
              Text(
                '4.9',
                style: AppTypography.body.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(width: 8.w),
              const _StarRow(rating: 4.9),
              SizedBox(width: 8.w),
              Text(
                'Exceptional',
                style: AppTypography.smallText.copyWith(color: AppColors.neutral500),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          const Divider(color: AppColors.neutral200, height: 1),
          SizedBox(height: 24.h),
          const _StatRow(
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppColors.success500,
            label: 'Payment verified',
            value: '100%',
          ),
          SizedBox(height: 20.h),
          const _StatRow(
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppColors.success500,
            label: 'Response rate',
            value: '98%',
          ),
          SizedBox(height: 20.h),
          const _StatRow(
            icon: Icons.access_time_rounded,
            iconColor: AppColors.primary500,
            label: 'Avg. response time',
            value: 'Within 4 hrs',
          ),
          SizedBox(height: 20.h),
          const _StatRow(
            icon: Icons.work_outline_rounded,
            iconColor: AppColors.primary500,
            label: 'Repeat hire rate',
            value: '72%',
          ),
          SizedBox(height: 24.h),
          const Divider(color: AppColors.neutral200, height: 1),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded, color: AppColors.primary600, size: 20.sp),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    'NorthStar has a strong track record of hiring experienced freelancers.',
                    style: AppTypography.smallText.copyWith(color: AppColors.primary700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StarRow extends StatelessWidget {
  final double rating;

  const _StarRow({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final fill = (rating - index).clamp(0.0, 1.0);
        return Icon(
          fill >= 1.0
              ? Icons.star_rounded
              : fill > 0
                  ? Icons.star_half_rounded
                  : Icons.star_border_rounded,
          color: AppColors.warning400,
          size: 18.sp,
        );
      }),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: iconColor),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(label, style: AppTypography.smallText),
        ),
        Text(
          value,
          style: AppTypography.smallText.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.neutral900,
          ),
        ),
      ],
    );
  }
}

