import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/company_activation.dart';

class CompanyActivationCard extends StatelessWidget {
  final CompanyActivation company;

  const CompanyActivationCard({
    super.key,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.iconTextGap),
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        color: colorTheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorTheme.onSurface,
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
              color: AppColors.primary600,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.business, color: AppColors.white, size: 24),
          ),
          const SizedBox(width: AppSpacing.sectionInternalPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company.name, style: textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(
                  company.category,
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
                company.date,
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                company.status,
                style: textTheme.bodySmall?.copyWith(
                  color: company.status == 'Active'
                      ? AppColors.success600
                      : company.status == 'Rejected'
                          ? AppColors.error600
                          : AppColors.warning600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
