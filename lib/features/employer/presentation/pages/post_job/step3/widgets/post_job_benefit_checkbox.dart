import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobBenefitCheckbox extends StatelessWidget {
  final String label;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const PostJobBenefitCheckbox({
    super.key,
    required this.label,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      borderRadius: BorderRadius.circular(4.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: isChecked ? AppColors.primary600 : AppColors.white,
                borderRadius: BorderRadius.circular(4.r),
                border: isChecked
                    ? null
                    : Border.all(color: AppColors.neutral300, width: 1.5.w),
              ),
              child: isChecked
                  ? Icon(
                      Icons.check_rounded,
                      size: 14.sp,
                      color: AppColors.white,
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
