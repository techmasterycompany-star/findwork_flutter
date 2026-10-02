import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class BasicPlanCard extends StatelessWidget {
  final VoidCallback? onGetStarted;

  const BasicPlanCard({super.key, this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan name
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.primary200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'BASIC Plane',
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.primary700,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            'Perfect for candidates starting their\njob search',
            style: textTheme.bodyMedium?.copyWith(
              color: AppColors.neutral700,
              fontWeight: FontWeight.w600,
              height: 1.15,
            ),
          ),

          const SizedBox(height: 12),

          // Divider
          const Divider(color: AppColors.neutral400, thickness: 0.7, height: 1),

          const SizedBox(height: 20),

          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$0',
                style: textTheme.headlineSmall?.copyWith(
                  color: AppColors.neutral900,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  '/month',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Get Started Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: onGetStarted,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary600,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Divider(color: AppColors.neutral400, thickness: 0.7, height: 1),

          const SizedBox(height: 18),

          // Features
          const _BasicFeature(text: 'Apply to standard job'),

          const SizedBox(height: 12),

          const _BasicFeature(text: 'Create your profile'),

          const SizedBox(height: 12),

          const _BasicFeature(text: 'Job filter & search'),
        ],
      ),
    );
  }
}

class _BasicFeature extends StatelessWidget {
  final String text;

  const _BasicFeature({required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary200,
          ),
          child: const Icon(Icons.check, size: 11, color: AppColors.primary600),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.neutral700,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
