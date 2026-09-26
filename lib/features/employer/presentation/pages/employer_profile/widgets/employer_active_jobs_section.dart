import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'employer_active_job_card.dart';

class EmployerActiveJobsSection extends StatelessWidget {
  const EmployerActiveJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.neutral100,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      '03 / Open opportunities',
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Active jobs',
                    style: AppTypography.cardTitle,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary600,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: const BorderSide(color: AppColors.primary200),
                  ),
                ),
                child: Text(
                  'View all',
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          const EmployerActiveJobCard(
            title: 'Senior Product Designer for Fintech Platform',
            budgetType: 'Fixed',
            budget: '\$3,500–\$5,000',
            level: 'Expert',
            location: 'Remote',
            skills: ['UI Design', 'Figma', 'Fintech'],
            postedDate: 'July 12',
          ),
          SizedBox(height: 24.h),
          const EmployerActiveJobCard(
            title: 'UX Researcher for Mobility Product (Part-Time)',
            budgetType: 'Hourly',
            budget: '\$60–\$80/hr',
            level: 'Intermediate',
            location: 'Copenhagen, Denmark',
            skills: ['UX Research', 'Interviews', 'Usability Testing'],
            postedDate: 'July 9',
          ),
          SizedBox(height: 24.h),
          const EmployerActiveJobCard(
            title: 'Brand Identity & Digital Experience Designer',
            budgetType: 'Fixed',
            budget: '\$2,000–\$3,500',
            level: 'Intermediate',
            location: 'Remote',
            skills: ['Branding', 'Illustration', 'After Effects'],
            postedDate: 'July 5',
          ),
        ],
      ),
    );
  }
}

