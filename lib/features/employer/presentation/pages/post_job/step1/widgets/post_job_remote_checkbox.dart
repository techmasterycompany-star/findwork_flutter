import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobRemoteCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const PostJobRemoteCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.w,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.primary600 : AppColors.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: isChecked ? AppColors.primary600 : AppColors.neutral300,
                width: 1.5.w,
              ),
            ),
            child: isChecked
                ? Icon(
                    Icons.check_rounded,
                    size: 12.sp,
                    color: AppColors.white,
                  )
                : null,
          ),
          SizedBox(width: 10.w),
          Text(
            'This is a fully remote position',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral700,
            ),
          ),
        ],
      ),
    );
  }
}
