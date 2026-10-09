import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/employer_home_job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeActiveJobsSection extends StatelessWidget {
  const EmployerHomeActiveJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Text(
            'Active Job Postings',
            style: AppTypography.cardTitle.copyWith(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Manage your currently listed remote and contract job listings',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 20.h),

          // Job Card 1 using public EmployerHomeJobCard
          const EmployerHomeJobCard(
            postedTime: 'Posted 4 days ago',
            statusLabel: 'Active',
            statusColor: AppColors.success600,
            statusBgColor: AppColors.success50,
            jobTitle: 'UI/UX Designer',
            applicationsCount: '24 applications',
            viewsCount: '1.2k Views',
          ),
          SizedBox(height: 16.h),

          // Job Card 2
          const EmployerHomeJobCard(
            postedTime: 'Posted 12 days ago',
            statusLabel: 'Reviewing',
            statusColor: AppColors.warning600,
            statusBgColor: AppColors.warning50,
            jobTitle: 'Senior DevOps Architect',
            applicationsCount: '15 applications',
            viewsCount: '310 Views',
          ),
          SizedBox(height: 20.h),

          // View all link
          Center(
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View all Open Postings (3)',
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
