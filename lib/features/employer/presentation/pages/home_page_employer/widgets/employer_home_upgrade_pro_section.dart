import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/perk_item.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeUpgradeProSection extends StatelessWidget {
  const EmployerHomeUpgradeProSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.primary950,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary950.withValues(alpha: 0.3),
              blurRadius: 16.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Reach 10x more qualified freelancers with Job4U Pro',
              style: AppTypography.h3.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                height: 1.3,
              ),
            ),
            SizedBox(height: 10.h),

            // Subtitle
            Text(
              'Pro employers get their job listings pinned to top categories and gain unlimited access to the full vetting database.',
              style: AppTypography.smallText.copyWith(
                color: AppColors.neutral300,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24.h),

            // Buttons
            Column(
              children: [
                CustomButton(
                  text: 'Upgrade to Employer Pro',
                  variant: CustomButtonVariant.primary,
                  height: 48.h,
                  width: double.infinity,
                  onPressed: () {},
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  text: 'Compare Premium Plans',
                  variant: CustomButtonVariant.outlined,
                  borderColor: AppColors.white,
                  textColor: AppColors.white,
                  height: 46.h,
                  width: double.infinity,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Perks using public PerkItem from utils
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PerkItem(text: 'No spam, ever'),
                SizedBox(height: 8.h),
                PerkItem(text: 'Cancel anytime'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
