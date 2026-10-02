import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/stat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerStatsBar extends StatelessWidget {
  const EmployerStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary600,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          StatItem(value: '43', label: 'Jobs posted'),
          VerticalDividerWidget(),
          StatItem(value: '39', label: 'Hired'),
          VerticalDividerWidget(),
          StatItem(value: '\$234k', label: 'Total spent'),
          VerticalDividerWidget(),
          StatItem(value: '81%', label: 'Hire rate'),
        ],
      ),
    );
  }
}
