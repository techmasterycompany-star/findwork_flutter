import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerCtaCard extends StatelessWidget {
  const EmployerCtaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.06),
            blurRadius: 12.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            '[ A good next step ]',
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral400,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 20.h),
          // Headline
          Text(
            'Review the work. Then make the first move.',
            style: AppTypography.cardTitle.copyWith(
              color: AppColors.neutral900,
              height: 1.4,
            ),
          ),
          SizedBox(height: 10.h),
          // Subtext
          Text(
            'Ask a question about an open role or share a little about how you could help.',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),
          CustomButton(
            text: 'Start a conversation',
            variant: CustomButtonVariant.primary,
            height: 40.h,
            width: double.infinity,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

