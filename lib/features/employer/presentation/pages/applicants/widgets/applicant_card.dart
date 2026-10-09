import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_skill_tag.dart';
import 'applicant_status_badge.dart';

class ApplicantCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String location;
  final String experience;
  final double matchScore;
  final String status;
  final List<String> skills;
  final String appliedDate;
  final VoidCallback onViewProfile;
  final VoidCallback onShortlist;

  const ApplicantCard({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.location,
    required this.experience,
    required this.matchScore,
    required this.status,
    required this.skills,
    required this.appliedDate,
    required this.onViewProfile,
    required this.onShortlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.primary100,
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: AppTypography.cardTitle.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.cardTitle.copyWith(
                        color: AppColors.neutral900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      jobTitle,
                      style: AppTypography.smallText.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Wrap(
                      spacing: 12.w,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.location_on_outlined, size: 13.sp, color: AppColors.neutral400),
                            SizedBox(width: 2.w),
                            Text(location, style: AppTypography.caption.copyWith(color: AppColors.neutral500)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.work_outline, size: 13.sp, color: AppColors.neutral400),
                            SizedBox(width: 2.w),
                            Text(experience, style: AppTypography.caption.copyWith(color: AppColors.neutral500)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ApplicantStatusBadge(status: status),
                  SizedBox(width: 8.w),
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: const BoxDecoration(
                      color: AppColors.primary50,
                      shape: BoxShape.circle,
                    ),
                    child: PopupMenuButton<String>(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.more_vert, color: AppColors.primary600, size: 18.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'approve',
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.success50,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.check, color: AppColors.success600, size: 18.sp),
                                SizedBox(width: 8.w),
                                Text(
                                  'Approve Applicant',
                                  style: AppTypography.smallText.copyWith(
                                    color: AppColors.success600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline, color: AppColors.error500, size: 18.sp),
                              SizedBox(width: 8.w),
                              Text(
                                'Delete Applicant',
                                style: AppTypography.smallText.copyWith(
                                  color: AppColors.error500,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 'approve') {
                          // Handle approve
                        } else if (value == 'delete') {
                          // Handle delete
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          if (skills.isNotEmpty)
            Wrap(
              spacing: 6.w,
              runSpacing: 6.h,
              children: skills.map((skill) => ApplicantSkillTag(label: skill)).toList(),
            ),
          SizedBox(height: 12.h),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.success50,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bolt, size: 13.sp, color: AppColors.success600),
                    SizedBox(width: 3.w),
                    Text(
                      '${matchScore.toInt()}% Match',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.success700,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Applied $appliedDate',
                style: AppTypography.caption.copyWith(color: AppColors.neutral400),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onShortlist,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary600),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Shortlist',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primary600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: GestureDetector(
                  onTap: onViewProfile,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary600,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'View Profile',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
