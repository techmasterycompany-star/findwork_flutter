import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'post_job_skill_chip.dart';

class PostJobSkillsInput extends StatelessWidget {
  final TextEditingController controller;
  final List<String> skills;
  final ValueChanged<String> onAddSkill;
  final ValueChanged<String> onRemoveSkill;
  final String? helperText;

  const PostJobSkillsInput({
    super.key,
    required this.controller,
    required this.skills,
    required this.onAddSkill,
    required this.onRemoveSkill,
    this.helperText,
  });

  void _handleSubmit(String val) {
    final trimmed = val.trim();
    if (trimmed.isNotEmpty) {
      onAddSkill(trimmed);
      controller.clear();
    }
  }

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
                      'Skills Tags',
                      style: AppTypography.caption.copyWith(
                        color: AppColors.neutral700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                onSubmitted: _handleSubmit,
                textInputAction: TextInputAction.done,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral700,
                ),
                decoration: InputDecoration(
                  hintText: 'Type a skill and press Enter...',
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
        if (skills.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: skills.map((skill) {
              return PostJobSkillChip(
                label: skill,
                onDeleted: () => onRemoveSkill(skill),
              );
            }).toList(),
          ),
        ],
        if (helperText != null) ...[
          SizedBox(height: 8.h),
          Text(
            helperText!,
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral400,
              fontSize: 11.sp,
            ),
          ),
        ],
      ],
    );
  }
}
