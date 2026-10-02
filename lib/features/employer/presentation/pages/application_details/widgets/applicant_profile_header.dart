import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String location;
  final String email;
  final String matchScore;

  const ApplicantProfileHeader({
    Key? key,
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.matchScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: AppColors.primary100,
            backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=47'), // Placeholder matching image type
          ),
          SizedBox(height: 16.h),
          Text(
            name,
            style: AppTypography.h2.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            role,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '$location - $email',
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral400,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              border: Border.all(color: AppColors.primary200),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  matchScore.split(' ').first,
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4.w),
                Text(
                  matchScore.split(' ').skip(1).join(' '),
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.primary600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
