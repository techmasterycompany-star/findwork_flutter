import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/job.dart';

class JobManagementCard extends StatelessWidget {
  final Job job;
  final VoidCallback? onReview;

  const JobManagementCard({super.key, required this.job, this.onReview});

  Color _statusBgColor(ColorScheme colorTheme) {
    switch (job.status) {
      case 'Accepted':
        return AppColors.success50;
      case 'Rejected':
        return AppColors.error50;
      default:
        return AppColors.warning50;
    }
  }

  Color _statusTextColor(ColorScheme colorTheme) {
    switch (job.status) {
      case 'Accepted':
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
        borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
        boxShadow: [
          BoxShadow(
            color: colorTheme.onSurface,
            offset: const Offset(0, 1),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: colorTheme.primary,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
                child: Icon(
                  Icons.business,
                  color: colorTheme.onPrimary,
                  size: 25,
                ),
              ),
              AppSpacing.horizontal24,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(job.companyName, style: textTheme.bodyMedium),
                        Text(
                          job.date,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorTheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    AppSpacing.vertical8,
                    Row(
                      children: [
                        Text(
                          job.jobTitle,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorTheme.onSurface,
                          ),
                        ),
                        AppSpacing.horizontal8,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.iconTextGap,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success200,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusTiny,
                            ),
                          ),
                          child: Text(job.jobType, style: textTheme.bodySmall),
                        ),
                      ],
                    ),
                    AppSpacing.vertical8,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.iconTextGap,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBgColor(colorTheme),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusTiny,
                        ),
                      ),
                      child: Text(
                        job.status,
                        style: textTheme.bodySmall?.copyWith(
                          color: _statusTextColor(colorTheme),
                        ),
                      ),
                    ),
                  ],
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
