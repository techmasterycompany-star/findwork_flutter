import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/activity_stat_row.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/interview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeHiringActivitySection extends StatelessWidget {
  const EmployerHomeHiringActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Text(
            'Hiring Activity Overview',
            style: AppTypography.cardTitle.copyWith(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Track applications, scheduled meetings, and talent onboarding pipeline',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 20.h),

          // Stats items using public ActivityStatRow
          const ActivityStatRow(
            icon: Icons.assignment_outlined,
            title: 'Applications Received',
            count: '68',
            changeLabel: '+12% vs last week',
            changeColor: AppColors.success600,
          ),
          SizedBox(height: 12.h),

          const ActivityStatRow(
            icon: Icons.calendar_month_outlined,
            title: 'Interviews Booked',
            count: '8',
            changeLabel: '3 scheduled today',
            changeColor: AppColors.success600,
          ),
          SizedBox(height: 12.h),

          const ActivityStatRow(
            icon: Icons.check_circle_outline_rounded,
            title: 'Offers Sent',
            count: '2',
            changeLabel: '1 pending acceptance',
            changeColor: AppColors.neutral500,
          ),
          SizedBox(height: 24.h),

          // Upcoming Interviews Container using public InterviewItem
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.neutral200),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral900.withValues(alpha: 0.04),
                  blurRadius: 10.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upcoming Interviews',
                  style: AppTypography.cardTitle.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                const InterviewItem(
                  time: '10:00',
                  period: 'AM',
                  name: 'Sarah Jenkins',
                  details: 'Senior React Developer · Zoom',
                ),
                SizedBox(height: 12.h),
                const Divider(color: AppColors.neutral200, height: 1),
                SizedBox(height: 12.h),
                const InterviewItem(
                  time: '02:30',
                  period: 'PM',
                  name: 'David Kross',
                  details: 'Lead UI/UX Designer · Meet',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
