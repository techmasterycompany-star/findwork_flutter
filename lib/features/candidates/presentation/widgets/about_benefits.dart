import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AboutBenefits extends StatelessWidget {
  const AboutBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final benefits = [
      (
        Icons.shield_outlined,
        'Trust & Safety',
        'Every freelancer on our'
            'platform is verified. Secure'
            'payments and escrow'
            ' protection keep every'
            ' transaction safe for both'
            ' parties.',
      ),
      (
        Icons.public_outlined,
        'Global Reach',
        'Access skilled professionals'
            ' from 190+ countries. Whether'
            ' you need a developer in Berlin'
            ' or a designer in Cairo, we'
            ' have you covered.',
      ),
      (
        Icons.workspace_premium_outlined,
        'Quality First',
        'Our rating and review system '
            ' ensures only the best'
            ' freelancers rise to the top.'
            ' Every completed job is'
            ' verified and reviewed.',
      ),
      (
        Icons.bolt_outlined,
        'Speed & Efficiency',
        'Post a job, receive'
            ' proposals, and hire within '
            ' hours — not days. Our smart'
            ' matching algorithm'
            ' connects you with the right'
            ' talent fast.',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: benefits.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.90,
      ),
      itemBuilder: (context, index) {
        final benefit = benefits[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.primary200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary300, width: 1.5),
                  ),
                  child: Icon(
                    benefit.$1,
                    color: theme.colorScheme.primary,
                    size: 25,
                  ),
                ),

                const Spacer(),

                Text(
                  benefit.$2,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                AppSpacing.vertical8,

                Text(benefit.$3, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        );
      },
    );
  }
}
