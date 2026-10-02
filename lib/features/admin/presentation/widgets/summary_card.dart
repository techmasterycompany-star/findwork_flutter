import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String number;
  final String subTitle;
  final VoidCallback? onClick;
  final bool isFirst;
  const SummaryCard({
    super.key,
    required this.title,
    required this.number,
    required this.subTitle,
    this.onClick,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final bool light = isFirst;
    final Color bgColor = light ? AppColors.primary600 : colorTheme.surface;
    final Color textColor = light ? AppColors.white : colorTheme.onSurface;
    final Color subtitleColor = light ? AppColors.primary100 : colorTheme.onSurface;

    return GestureDetector(
      onTap: onClick ?? () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: colorTheme.onSurface,
              offset: const Offset(-0.5, 1),
              blurRadius: 0.5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.cardPadding),
              child: Column(
                spacing: AppSpacing.cardGapSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: textTheme.bodySmall?.copyWith(color: textColor),
                  ),
                  Text(
                    number,
                    style: textTheme.displaySmall?.copyWith(color: textColor),
                  ),
                  Text(
                    subTitle,
                    style: textTheme.bodySmall?.copyWith(color: subtitleColor),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Icon(
                  Icons.arrow_outward_rounded,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
