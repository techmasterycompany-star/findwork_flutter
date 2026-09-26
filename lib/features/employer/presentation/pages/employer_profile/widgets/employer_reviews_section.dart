import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/section_label.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/star_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'employer_review_card.dart';

class EmployerReviewsSection extends StatelessWidget {
  const EmployerReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SectionLabel(label: '04 / Field notes'),
              const Spacer(),
              Text(
                'FIELD NOTE / 39',
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral400,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Reviews from freelancers',
            style: AppTypography.cardTitle,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        '4.9',
                        style: AppTypography.h3.copyWith(
                          color: AppColors.neutral900,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const StarRow(rating: 4.9, iconSize: 20),
                    ],
                  ),
                  Text(
                    '39 reviews',
                    style: AppTypography.caption.copyWith(color: AppColors.neutral400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Review cards
          const EmployerReviewCard(
            reviewText:
                '"NorthStar gave the project the clarity and care it deserved. The brief was sharp, feedback was thoughtful, and invoices were always handled promptly."',
            rating: 5.0,
            date: 'May 2024',
            projectName: 'Fintech onboarding redesign',
            reviewerName: 'Maya Lindström',
            reviewerTitle: 'Product designer',
          ),
          SizedBox(height: 24.h),
          const EmployerReviewCard(
            reviewText:
                '"One of the most considered clients I\'ve worked with. They know what good looks like, but still make room for a partner\'s point of view."',
            rating: 5.0,
            date: 'May 2024',
            projectName: 'Brand system for Norr',
            reviewerName: 'Jonas Reeve',
            reviewerTitle: 'Brand strategist',
          ),
        ],
      ),
    );
  }
}
