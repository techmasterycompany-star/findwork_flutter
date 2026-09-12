import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/user_management_data.dart';

class UserCard extends StatelessWidget {
  final UserManagementData user;
  final VoidCallback onDelete;

  const UserCard({
    super.key,
    required this.user,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bool isActive = user.status == 'Active';

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.iconTextGap),
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        color: colorTheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorTheme.onSurface.withValues(alpha: 0.08),
            offset: const Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: user.isCompany ? AppColors.primary600 : AppColors.neutral300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: user.isCompany
                ? const Icon(Icons.business, color: AppColors.white, size: 24)
                : const Icon(Icons.person, color: AppColors.neutral600, size: 24),
          ),
          const SizedBox(width: AppSpacing.sectionInternalPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(
                  user.role,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorTheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                user.date,
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.success50 : AppColors.error50,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  user.status,
                  style: textTheme.bodySmall?.copyWith(
                    color: isActive ? AppColors.success600 : AppColors.error600,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.iconTextGap),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, color: AppColors.error500, size: 20),
          ),
        ],
      ),
    );
  }
}
