import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateHeader extends StatelessWidget {
  final String name;
  final String title;
  final String location;
  final String lastActivity;
  final String joinedDate;
  final VoidCallback? onContact;
  final VoidCallback? onSave;
  final VoidCallback? onDownloadCv;

  const CandidateHeader({
    super.key,
    this.name = 'Sarah Johnson',
    this.title = 'Software Engineer',
    this.location = 'San Francisco, California',
    this.lastActivity = 'Last activity 3 days ago',
    this.joinedDate = 'Joined March 2023',
    this.onContact,
    this.onSave,
    this.onDownloadCv,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 140.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary900,
                    AppColors.primary700,
                    AppColors.primary600,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -20.w,
                    top: -20.h,
                    child: Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(alpha: 0.05),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40.w,
                    bottom: -30.h,
                    child: Container(
                      width: 160.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(alpha: 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.w,
              bottom: -40.h,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 3.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.1),
                      blurRadius: 8.r,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    'assets/images/employers_utils/homepage_employer/interviews/candidate_1.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.primary100,
                      child: Icon(
                        Icons.person,
                        size: 40.sp,
                        color: AppColors.primary600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 48.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTypography.h2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                title,
                style: AppTypography.cardTitle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16.sp,
                    color: AppColors.primary600,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    location,
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(
                    lastActivity,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '•',
                    style: TextStyle(color: AppColors.neutral400, fontSize: 10.sp),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    joinedDate,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onContact ?? () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary600,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        elevation: 0,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Contact this candidate',
                          style: AppTypography.smallText.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: onSave,
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.primary200),
                      ),
                      child: Icon(
                        Icons.bookmark_outline_rounded,
                        color: AppColors.primary600,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: onDownloadCv,
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.primary200),
                      ),
                      child: Icon(
                        Icons.download_rounded,
                        color: AppColors.primary600,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
