import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
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
              _InfoChip(
                icon: Icons.attach_money_rounded,
                label: '$budgetType · $budget',
              ),
              SizedBox(width: 8.w),
              _InfoChip(
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
                  .map((skill) => _SkillTag(label: skill))
                  .toList(),
            ),
          ],
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 36.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary600,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'View & Apply',
                style: AppTypography.smallText.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13.sp, color: AppColors.neutral500),
          SizedBox(width: 4.w),
          Text(
            label,
            style: AppTypography.caption.copyWith(color: AppColors.neutral600),
          ),
        ],
      ),
    );
  }
}

class _SkillTag extends StatelessWidget {
  final String label;

  const _SkillTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary100),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: AppColors.primary700,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

