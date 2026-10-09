import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class CareerProPlanCard extends StatelessWidget {
  final VoidCallback? onSelectPro;

  const CareerProPlanCard({super.key, this.onSelectPro});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.primary500,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary500.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plan name
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Career Pro',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColors.neutral800,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                'Perfect for candidates who want to stand\nout',
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.15,
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              const Divider(
                color: AppColors.primary300,
                thickness: 0.8,
                height: 1,
              ),

              const SizedBox(height: 20),

              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$49',
                    style: textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      '/month',
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                'Best choice',
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 14),

              // Select Pro button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: onSelectPro,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary50,
                    foregroundColor: AppColors.neutral800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'Select Pro',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              const Divider(
                color: AppColors.primary300,
                thickness: 0.8,
                height: 1,
              ),

              const SizedBox(height: 20),

              // Features
              const _ProFeature(text: 'Unlimited Job Application'),

              const SizedBox(height: 12),

              const _ProFeature(text: 'Featured Candidates Profile'),

              const SizedBox(height: 12),

              const _ProFeature(text: 'Priority Support'),

              const SizedBox(height: 12),

              const _ProFeature(text: 'Application Tracking'),
            ],
          ),

          // Best Choice Star
          Positioned(
            top: -34,
            right: -10,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.star,
                    color: AppColors.warning400,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProFeature extends StatelessWidget {
  final String text;

  const _ProFeature({required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        const Icon(Icons.check_circle, color: AppColors.white, size: 17),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
