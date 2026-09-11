import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String number; // I made it string because there's also percentage
  final String subTitle;
  final VoidCallback? onClick;
  const SummaryCard({
    super.key,
    required this.title,
    required this.number,
    required this.subTitle,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onClick ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: colorTheme.surface,
      
          boxShadow: [BoxShadow(color: colorTheme.onSurface,
          offset: Offset(-0.5, 1),
          blurRadius: 0.5
          )],
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.cardPadding),
              child: Column(
                spacing: AppSpacing.cardGapSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: textTheme.bodySmall,),
                  Text(number, style: textTheme.bodyMedium,),
                  Text(subTitle, style: textTheme.bodySmall,),
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
                child: const Icon(Icons.arrow_outward_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
