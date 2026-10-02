import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantsFilterBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const ApplicantsFilterBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (i) {
          final isSelected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onTabSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary600 : AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? AppColors.primary600 : AppColors.neutral200,
                ),
              ),
              child: Text(
                tabs[i],
                style: AppTypography.smallText.copyWith(
                  color: isSelected ? AppColors.white : AppColors.neutral600,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
