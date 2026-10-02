import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AboutJourney extends StatelessWidget {
  const AboutJourney({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final journey = [
      (
        '2019',
        'Job4U was founded in Cairo with a vision to bridge the global talent gap.',
      ),
      (
        '2020',
        'Launched beta with 10,000 early freelancers across 15 countries.',
      ),
      (
        '2021',
        'Reached \$50M in project value processed. Expanded to the mena region.',
      ),
      (
        '2022',
        'Series B funding of \$120M. Launched enterprise contracts and team plans.',
      ),
      (
        '2023',
        'Crossed 1 million active freelancers. Named Top 10 Global Freelance Platform.',
      ),
      (
        '2024',
        'AI-powered job matching launched. Now serving 190+ countries worldwide.',
      ),
    ];

    return Column(
      children: [
        Text(
          'Since 2019',
          style: TextStyle(
            color: AppColors.primary600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          'Our Journey So For',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        AppSpacing.vertical20,

        ...journey.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 48,
                  child: Text(
                    item.$1,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),

                AppSpacing.horizontal12,

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.gray200, width: 1),
                    ),
                    child: Text(item.$2, style: theme.textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
