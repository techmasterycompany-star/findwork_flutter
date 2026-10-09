import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateCtaBanner extends StatelessWidget {
  final VoidCallback? onGetStarted;
  final VoidCallback? onBrowseJobs;

  const CandidateCtaBanner({
    super.key,
    this.onGetStarted,
    this.onBrowseJobs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary900,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Column(
        children: [
          Text(
            'Join us today and discover thousands of Jobs',
            textAlign: TextAlign.center,
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Create your free account and interact with top employers who are looking for someone exactly like you.',
            textAlign: TextAlign.center,
            style: AppTypography.smallText.copyWith(
              color: AppColors.primary100,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onGetStarted,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Get Started — It's Free",
                    style: AppTypography.smallText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onBrowseJobs,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    side: const BorderSide(color: AppColors.primary300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Browse Jobs',
                    style: AppTypography.smallText.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureItem(Icons.verified_user_outlined, 'No spam, ever'),
              _buildFeatureItem(Icons.business_center_outlined, 'Direct employer'),
            ],
          ),
          SizedBox(height: 12.h),
          _buildFeatureItem(Icons.people_outline_rounded, '50,000+ job seekers'),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: AppColors.success400,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: AppTypography.caption.copyWith(
            color: AppColors.primary100,
          ),
        ),
      ],
    );
  }
}
