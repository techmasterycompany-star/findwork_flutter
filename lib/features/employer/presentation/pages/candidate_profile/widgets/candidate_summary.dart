import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateSummary extends StatelessWidget {
  final String summaryText;

  const CandidateSummary({
    super.key,
    this.summaryText =
        'Sarah Johnson is a highly skilled software engineer with 5 years of experience building web-based applications. She has expertise in Python, Java, and Ruby on Rails to achieve a deep understanding of cloud computing technologies. Sarah has a proven track record of delivering high-quality solutions that meet or exceed client expectations.',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary600,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Summary',
            style: AppTypography.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            summaryText,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral600,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
