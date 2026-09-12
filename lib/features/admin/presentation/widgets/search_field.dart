import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class AppSearchField extends StatelessWidget {
  final String hintText;
  final String? searchQuery;
  final ValueChanged<String> onChanged;

  const AppSearchField({
    super.key,
    required this.hintText,
    this.searchQuery,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      initialValue: searchQuery,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hintText,
        hintStyle: textTheme.bodySmall?.copyWith(
          color: colorTheme.onSurface.withValues(alpha: 0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorTheme.onSurface.withValues(alpha: 0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorTheme.onSurface.withValues(alpha: 0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary600),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sectionInternalPadding,
          vertical: AppSpacing.iconTextGap,
        ),
      ),
    );
  }
}
