import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_section_container.dart';

class ApplicantSkillsSection extends StatelessWidget {
  final List<String> skills;

  const ApplicantSkillsSection({
    Key? key,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Skills & Expertise',
      child: Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: skills.map((skill) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primary50,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              skill,
              style: AppTypography.caption.copyWith(
                color: AppColors.primary700,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
