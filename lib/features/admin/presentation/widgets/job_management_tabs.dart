import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class JobManagementTabs extends StatelessWidget {
  final String? statusFilter;
  final ValueChanged<String?> onStatusFilterChanged;
  final int pendingCount;
  final int approvedCount;
  final int totalCount;

  const JobManagementTabs({
    super.key,
    required this.statusFilter,
    required this.onStatusFilterChanged,
    required this.pendingCount,
    required this.approvedCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        _TabChip(
          label: 'All',
          count: totalCount,
          isSelected: statusFilter == null,
          onTap: () => onStatusFilterChanged(null),
        ),
        AppSpacing.horizontal8,
        _TabChip(
          label: 'Pending',
          count: pendingCount,
          isSelected: statusFilter == 'Pending',
          onTap: () => onStatusFilterChanged('Pending'),
        ),
        AppSpacing.horizontal8,
        _TabChip(
          label: 'Approved',
          count: approvedCount,
          isSelected: statusFilter == 'Accepted',
          onTap: () => onStatusFilterChanged('Accepted'),
        ),
      ],
    );
  }
}

class _TabChip extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabChip({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary600 : colorTheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          border: Border.all(
            color: isSelected
                ? AppColors.primary600
                : colorTheme.onSurface,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                color: isSelected ? AppColors.white : colorTheme.onSurface,
              ),
            ),
            AppSpacing.horizontal8,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
              ),
              child: Text(
                '$count',
                style: textTheme.bodySmall?.copyWith(
                  color: isSelected ? AppColors.white : colorTheme.onSurface,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
