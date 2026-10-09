import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobTextArea extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool isRequired;
  final int maxLines;

  const PostJobTextArea({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.isRequired = false,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTypography.cardTitle.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.neutral800,
              ),
            ),
            if (isRequired)
              Text(
                ' *',
                style: AppTypography.cardTitle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.error500,
                ),
              ),
          ],
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: AppTypography.body.copyWith(
            color: AppColors.neutral900,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTypography.body.copyWith(
              color: AppColors.neutral400,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: AppColors.neutral300,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(
                color: AppColors.primary600,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
