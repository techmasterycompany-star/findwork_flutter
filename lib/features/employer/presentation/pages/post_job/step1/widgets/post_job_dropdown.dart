import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobDropdown extends StatelessWidget {
  final String label;
  final String value;
  final bool isRequired;
  final VoidCallback? onTap;

  const PostJobDropdown({
    super.key,
    required this.label,
    required this.value,
    this.isRequired = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.neutral200),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isRequired)
                    Text(
                      ' *',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.error500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: AppTypography.smallText.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20.sp,
                    color: AppColors.neutral400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
