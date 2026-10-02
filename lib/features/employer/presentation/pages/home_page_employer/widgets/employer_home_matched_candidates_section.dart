import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/candidates_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeMatchedCandidatesSection extends StatelessWidget {
  const EmployerHomeMatchedCandidatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Matched Candidates',
            style: AppTypography.cardTitle.copyWith(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Instantly matched with your active listings using Job4U's AI-Powered Match Engine",
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
              height: 1.4,
            ),
          ),
          SizedBox(height: 20.h),

           CandidateCard(
            name: 'Sarah Jenkins',
            title: 'Senior Full-Stack Engineer',
            matchPercentage: '98% Match',
            hourlyRate: '\$85/hr',
            skills: ['React', 'Node.js', 'TypeScript'],
            initials: 'SJ',
            inviteToApply: () {},
            viewProfile: () {},
          ),
          SizedBox(height: 16.h),

           CandidateCard(
            name: 'Clara Zhang',
            title: 'Product Manager',
            matchPercentage: '95% Match',
            hourlyRate: '\$110/hr',
            skills: ['Product Ops', 'Agile', 'SQL'],
            initials: 'CZ',
            inviteToApply: () {},
            viewProfile: () {},
          ),
          SizedBox(height: 20.h),

          Center(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Browse All Candidates',
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.primary600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 16.sp,
                    color: AppColors.primary600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


