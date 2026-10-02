import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostJobInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isRequired;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const PostJobInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = true,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
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
            keyboardType: keyboardType,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral700,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTypography.smallText.copyWith(
                color: AppColors.neutral400,
              ),
              contentPadding: EdgeInsets.fromLTRB(16.w, 6.h, 16.w, 10.h),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
