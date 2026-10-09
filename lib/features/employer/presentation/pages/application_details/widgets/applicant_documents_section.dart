import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_section_container.dart';

class ApplicantDocumentsSection extends StatelessWidget {
  final List<String> documents;

  const ApplicantDocumentsSection({
    Key? key,
    required this.documents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Documents',
      child: Column(
        children: documents.map((doc) {
          return Container(
            margin: EdgeInsets.only(bottom: 8.h),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.neutral50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.neutral200),
            ),
            child: Row(
              children: [
                Icon(Icons.insert_drive_file_outlined, color: AppColors.primary500, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    doc,
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.file_download_outlined, color: AppColors.neutral500, size: 20.sp),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
