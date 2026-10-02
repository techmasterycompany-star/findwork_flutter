import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobDescriptionCard extends StatelessWidget {
  final String overview;
  final List<String> skills;
  final List<String> bulletPoints;

  const PostJobDescriptionCard({
    super.key,
    required this.overview,
    required this.skills,
    required this.bulletPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            overview,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 6.w,
            runSpacing: 6.h,
            children: skills.map((skill) => _buildSkillTag(skill)).toList(),
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColors.neutral200, height: 1.h),
          SizedBox(height: 16.h),
          Text(
            'Description',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 8.h),
          Column(
            children: bulletPoints
                .map(
                  (point) => Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point,
                            style: AppTypography.smallText.copyWith(
                              color: AppColors.neutral600,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillTag(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.neutral300),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.neutral700,
        ),
      ),
    );
  }
}
