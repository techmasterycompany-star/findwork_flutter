import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewItem extends StatelessWidget {
  final String time;
  final String period;
  final String name;
  final String details;

  const InterviewItem({
    super.key,
    required this.time,
    required this.period,
    required this.name,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Text(
                time,
                style: AppTypography.cardTitle.copyWith(
                  color: AppColors.primary600,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                period,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral400,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTypography.cardTitle.copyWith(
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                details,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
