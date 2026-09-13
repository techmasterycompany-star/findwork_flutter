import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/company_activation.dart';

class CompanyActivationCard extends StatelessWidget {
  final CompanyActivation company;
  final VoidCallback? onReview;

  const CompanyActivationCard({
    super.key,
    required this.company,
    this.onReview,
  });

  Color _statusBgColor(ColorScheme colorTheme) {
    switch (company.status) {
      case 'Active':
        return AppColors.success50;
      case 'Rejected':
        return AppColors.error50;
      default:
        return AppColors.warning50;
    }
  }

  Color _statusTextColor(ColorScheme colorTheme) {
    switch (company.status) {
      case 'Active':
        return AppColors.success600;
      case 'Rejected':
        return AppColors.error600;
      default:
        return AppColors.warning600;
    }
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorTheme.primary,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
                child: Icon(Icons.business, color: colorTheme.onPrimary, size: 24),
              ),
              AppSpacing.horizontal24,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(company.name, style: textTheme.bodyMedium),
                    AppSpacing.vertical8,
                    Text(
                      company.category,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorTheme.onSurface,
                      ),
                    ),
                    AppSpacing.vertical8,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.iconTextGap,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBgColor(colorTheme),
                        borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
                      ),
                      child: Text(
                        company.status,
                        style: textTheme.bodySmall?.copyWith(
                          color: _statusTextColor(colorTheme),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                company.date,
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
            ],
          ),
          AppSpacing.vertical24,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorTheme.primary,
                foregroundColor: colorTheme.onPrimary,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.titleToDescription,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
              ),
              child: const Text('Review'),
            ),
          ),
        ],
      ),
    );
  }
}
