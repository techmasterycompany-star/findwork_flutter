import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class ReviewSection extends StatelessWidget {
  final String title;
  final List<Widget> items;
  const ReviewSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.cardTitle.copyWith(
            fontSize: 18,
            color: AppColors.neutral900,
          ),
        ),
        AppSpacing.horizontal12,
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorTheme.surfaceContainer,
            boxShadow: [BoxShadow(color: colorTheme.inverseSurface, blurRadius: 1, spreadRadius: 1)],
            borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          ),
          child: Column(crossAxisAlignment: .start, children: items),
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String label;
  final String value;
  const ReviewItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: AppTypography.caption.copyWith(color: AppColors.neutral500),
          ),
          AppSpacing.vertical4,
          Text(
            value.isEmpty ? 'Not provided' : value,
            textAlign: TextAlign.start,

            style: AppTypography.body.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}