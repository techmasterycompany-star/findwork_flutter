import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? helperText;

  const PostJobTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = true,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.helperText,
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
              ),
              TextField(
                controller: controller,
                keyboardType: keyboardType,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral500,
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
        if (helperText != null) ...[
          SizedBox(height: 6.h),
          Text(
            helperText!,
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral400,
            ),
          ),
        ],
      ],
    );
  }
}
