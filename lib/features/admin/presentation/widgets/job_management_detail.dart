import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/job.dart';

class JobManagementDetail extends StatelessWidget {
  final Job job;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  const JobManagementDetail({
    super.key,
    required this.job,
    this.onApprove,
    this.onReject,
  });

  static void show(
    BuildContext context, {
    required Job job,
    VoidCallback? onApprove,
    VoidCallback? onReject,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusXLarge)),
      ),
      builder: (_) => JobManagementDetail(
        job: job,
        onApprove: onApprove,
        onReject: onReject,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorTheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusXLarge)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorTheme.onSurface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
                  ),
                ),
              ),
              AppSpacing.vertical24,
              Row(
                children: [
                  Text(
                    'Job Information',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              AppSpacing.vertical24,
              _buildJobOverview(textTheme, colorTheme),
              AppSpacing.vertical32,
              _buildSkillsSection(textTheme, colorTheme),
              AppSpacing.vertical32,
              _buildActionButtons(context, colorTheme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildJobOverview(TextTheme textTheme, ColorScheme colorTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorTheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.work, size: 18, color: colorTheme.primary),
              AppSpacing.horizontal8,
              Text(
                'Job Overview',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacing.vertical24,
          _buildInfoRow('Job Title', job.jobTitle, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Job Type', job.jobType, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Job expires in', job.expiresIn, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Job Level', job.jobLevel, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Offered Salary', job.salary, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Education', job.education, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Job Location', job.location, textTheme, colorTheme),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, TextTheme textTheme, ColorScheme colorTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorTheme.onSurface,
          ),
        ),
        AppSpacing.vertical8,
        Text(value, style: textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildSkillsSection(TextTheme textTheme, ColorScheme colorTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorTheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.psychology, size: 18, color: colorTheme.primary),
              AppSpacing.horizontal8,
              Text(
                'Skills/Specialization',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacing.vertical24,
          Wrap(
            spacing: AppSpacing.iconTextGap,
            runSpacing: AppSpacing.iconTextGap,
            children: job.skills.map(
              (skill) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sectionInternalPadding,
                  vertical: AppSpacing.iconTextGap,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary100,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
                child: Text(
                  skill,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorTheme.primary,
                  ),
                ),
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorScheme colorTheme) {
    return Row(
      spacing: AppSpacing.cardGapSmall,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onApprove?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success600,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.titleToDescription,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
            ),
            child: const Text('Approve Job'),
          ),
        ),
        AppSpacing.vertical12,
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              onReject?.call();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error600,
              side: const BorderSide(color: AppColors.error600),
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.titleToDescription,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
            ),
            child: const Text('Reject job'),
          ),
        ),
      ],
    );
  }
}
