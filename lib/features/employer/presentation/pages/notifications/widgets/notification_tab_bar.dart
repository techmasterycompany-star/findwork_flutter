import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationTabBar extends StatelessWidget {
  final int selectedIndex;
  final int allCount;
  final int candidatesCount;
  final ValueChanged<int> onTabSelected;

  const NotificationTabBar({
    super.key,
    required this.selectedIndex,
    required this.allCount,
    required this.candidatesCount,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabItem(
          label: 'All',
          count: allCount,
          isSelected: selectedIndex == 0,
          onTap: () => onTabSelected(0),
        ),
        SizedBox(width: 8.w),
        _TabItem(
          label: 'Candidates',
          count: candidatesCount,
          isSelected: selectedIndex == 1,
          onTap: () => onTabSelected(1),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary600 : AppColors.neutral100,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTypography.smallText.copyWith(
                color: isSelected ? AppColors.white : AppColors.neutral600,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.white.withValues(alpha: 0.25)
                    : AppColors.primary600,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '$count',
                style: AppTypography.caption.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
