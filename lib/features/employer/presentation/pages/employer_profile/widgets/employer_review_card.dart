import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/star_row.dart';
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
          Row(
            children: [
              StarRow(rating: rating, iconSize: 16.sp),
              SizedBox(width: 8.w),
              Text(
                rating.toStringAsFixed(1),
                style: AppTypography.smallText.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral900,
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: AppTypography.caption.copyWith(color: AppColors.neutral400),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              projectName,
              style: AppTypography.caption.copyWith(
                color: AppColors.primary700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            reviewText,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral700,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20.h),
          const Divider(color: AppColors.neutral100, height: 1),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: AppColors.primary100,
                child: Text(
                  reviewerName.isNotEmpty ? reviewerName[0] : '?',
                  style: AppTypography.smallText.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary600,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewerName,
                    style: AppTypography.smallText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutral900,
                    ),
                  ),
                  Text(
                    reviewerTitle,
                    style: AppTypography.caption.copyWith(color: AppColors.neutral400),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.thumb_up_outlined,
                  size: 16.sp,
                  color: AppColors.neutral400,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
