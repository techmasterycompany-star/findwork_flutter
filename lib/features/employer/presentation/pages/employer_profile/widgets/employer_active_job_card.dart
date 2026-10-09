import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/info_chip.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/skill_tag.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerActiveJobCard extends StatelessWidget {
  final String title;
  final String budgetType;
  final String budget;
  final String level;
  final String location;
  final List<String> skills;
  final String postedDate;

  const EmployerActiveJobCard({
    super.key,
    required this.title,
    required this.budgetType,
    required this.budget,
    required this.level,
    required this.location,
    required this.skills,
    required this.postedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withValues(alpha: 0.04),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.smallText.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutral900,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                postedDate,
                style: AppTypography.caption.copyWith(color: AppColors.neutral400),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              InfoChip(
                icon: Icons.attach_money_rounded,
                label: '$budgetType · $budget',
              ),
              SizedBox(width: 8.w),
              InfoChip(
                icon: Icons.signal_cellular_alt_rounded,
                label: level,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 14.sp, color: AppColors.neutral400),
              SizedBox(width: 4.w),
              Text(
                location,
                style: AppTypography.caption.copyWith(color: AppColors.neutral500),
              ),
            ],
          ),
          if (skills.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 6.h,
              children: skills
                  .map((skill) => SkillTag(label: skill))
                  .toList(),
            ),
          ],
          SizedBox(height: 16.h),
          CustomButton(
            text: 'View & Apply',
            variant: CustomButtonVariant.primary,
            height: 36.h,
            width: double.infinity,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
