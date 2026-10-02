import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_section_container.dart';

class ApplicantQuickActions extends StatelessWidget {
  final VoidCallback onSchedule;
  final VoidCallback onShortlist;
  final VoidCallback onMessage;
  final VoidCallback onReject;

  const ApplicantQuickActions({
    Key? key,
    required this.onSchedule,
    required this.onShortlist,
    required this.onMessage,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Quick Actions',
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onSchedule,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary600,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Schedule Interview',
                      style: AppTypography.smallText.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: onMessage,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.neutral200),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.chat_bubble_outline, color: AppColors.neutral600, size: 20.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onShortlist,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.success100,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Shortlist Candidate',
                      style: AppTypography.smallText.copyWith(
                        color: AppColors.success600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: onReject,
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.error50,
                    border: Border.all(color: AppColors.error100),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(Icons.close, color: AppColors.error500, size: 20.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
