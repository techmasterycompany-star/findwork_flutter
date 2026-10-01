import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_section_container.dart';

class ApplicantExperienceSection extends StatelessWidget {
  final List<Map<String, String>> experiences;

  const ApplicantExperienceSection({
    Key? key,
    required this.experiences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Work Experience',
      child: Column(
        children: experiences.asMap().entries.map((entry) {
          final int idx = entry.key;
          final Map<String, String> exp = entry.value;
          final bool isLast = idx == experiences.length - 1;

          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      exp['title'] ?? '',
                      style: AppTypography.smallText.copyWith(
                        color: AppColors.neutral900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      exp['duration'] ?? '',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.primary600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  exp['company'] ?? '',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  exp['description'] ?? '',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
