import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';

class HeadLine extends StatelessWidget {
  final String message;
  const HeadLine({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.iconTextGap),
      decoration: BoxDecoration(
        color: colorTheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorTheme.onSurface,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Text(message),
    );
  }
}
