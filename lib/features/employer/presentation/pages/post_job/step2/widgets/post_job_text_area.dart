import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobTextArea extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final String? helperText;
  final String? countText;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  const PostJobTextArea({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = true,
    this.controller,
    this.helperText,
    this.countText,
    this.minLines = 4,
    this.maxLines = 8,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.neutral200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
                child: Row(
                  children: [
                    Text(
                      label,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral700,
                        fontWeight: FontWeight.w600,
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
              ),
              TextField(
                controller: controller,
                minLines: minLines,
                maxLines: maxLines,
                onChanged: onChanged,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral700,
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppTypography.smallText.copyWith(
                    color: AppColors.neutral400,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ],
          ),
        ),
        if (helperText != null || countText != null) ...[
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (helperText != null)
                Expanded(
                  child: Text(
                    helperText!,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral400,
                      fontSize: 11.sp,
                    ),
                  ),
                ),
              if (countText != null) ...[
                SizedBox(width: 8.w),
                Text(
                  countText!,
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral400,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
