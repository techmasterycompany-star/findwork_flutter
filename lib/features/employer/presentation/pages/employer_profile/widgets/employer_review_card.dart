import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmployerReviewCard extends StatelessWidget {
  final String reviewText;
  final double rating;
  final String date;
  final String projectName;
  final String reviewerName;
  final String reviewerTitle;

  const EmployerReviewCard({
    super.key,
    required this.reviewText,
    required this.rating,
    required this.date,
    required this.projectName,
    required this.reviewerName,
    required this.reviewerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FIELD NOTE',
            style: AppTypography.caption.copyWith(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w700,
              color: AppColors.primary500,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            reviewText,
            style: AppTypography.body.copyWith(
              color: AppColors.neutral800,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Text(
                '$rating',
                style: AppTypography.smallText.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(width: 6.w),
              _StarRow(rating: rating),
              const Spacer(),
              Text(
                date,
                style: AppTypography.caption.copyWith(color: AppColors.neutral400),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Project · $projectName',
            style: AppTypography.caption.copyWith(color: AppColors.neutral500),
          ),
          SizedBox(height: 16.h),
          const Divider(color: AppColors.neutral100, height: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary200,
                child: Text(
                  reviewerName[0],
                  style: AppTypography.body.copyWith(
                    color: AppColors.primary700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewerName,
                      style: AppTypography.smallText.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      reviewerTitle,
                      style: AppTypography.caption.copyWith(color: AppColors.neutral500),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_rounded, color: AppColors.neutral400),
              ),
            ],
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
          size: 16.sp,
        );
      }),
    );
  }
}

