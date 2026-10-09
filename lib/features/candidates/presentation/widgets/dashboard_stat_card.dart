import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final String subtext;
  final bool isPrimary;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.subtext,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isPrimary
        ? AppColors.primary600
        : Theme.of(context).colorScheme.surface;
    final textColor = isPrimary ? AppColors.white : AppColors.neutral900;
    final subTextColor = isPrimary
        ? AppColors.neutral300
        : AppColors.neutral500;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        border: isPrimary ? null : Border.all(color: AppColors.neutral200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: subTextColor, fontSize: 11)),
              Icon(
                Icons.north_east,
                size: 14,
                color: isPrimary ? AppColors.white : AppColors.neutral500,
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Row(
            children: [
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isPrimary
                      ? AppColors.success300
                      : AppColors.success600,
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  subtext,
                  style: TextStyle(fontSize: 9, color: subTextColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
