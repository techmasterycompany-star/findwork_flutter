import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantSkillTag extends StatelessWidget {
  final String label;

  const ApplicantSkillTag({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: AppColors.neutral600,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
