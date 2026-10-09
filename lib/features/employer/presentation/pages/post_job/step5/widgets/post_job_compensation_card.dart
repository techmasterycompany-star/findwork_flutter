import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobCompensationCard extends StatelessWidget {
  final String salaryRange;
  final String period;
  final List<String> benefits;

  const PostJobCompensationCard({
    super.key,
    required this.salaryRange,
    required this.period,
    required this.benefits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.neutral200),
            ),
            child: RichText(
              text: TextSpan(
                style: AppTypography.cardTitle.copyWith(
                  color: AppColors.neutral900,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(text: salaryRange),
                  TextSpan(
                    text: ' / $period',
                    style: AppTypography.body.copyWith(
                      color: AppColors.neutral500,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Benefits',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Column(
            children: benefits
                .map(
                  (benefit) => Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            benefit,
                            style: AppTypography.smallText.copyWith(
                              color: AppColors.neutral600,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
