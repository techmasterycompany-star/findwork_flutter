import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/data/models/testimonial_card_model.dart';
import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialCardModel testimonial;
  final Widget? child;
  const TestimonialCard({super.key, required this.testimonial, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: AppColors.gray300, width: 0.75),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          child ??
              Icon(
                Icons.format_quote,
                color: theme.colorScheme.primary,
                size: 28,
              ),
          AppSpacing.vertical12,

          Text(
            testimonial.review,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface,
              height: 1.35,
            ),
          ),

          AppSpacing.vertical12,

          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(testimonial.image),
              ),

              AppSpacing.horizontal8,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(testimonial.role, style: theme.textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
