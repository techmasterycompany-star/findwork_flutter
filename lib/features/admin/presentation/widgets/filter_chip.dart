import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> options;
  final ValueChanged<String?> onSelected;

  const AppFilterChip({
    super.key,
    required this.label,
    this.selectedValue,
    required this.options,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final displayText = selectedValue ?? label;

    return GestureDetector(
      onTap: () => _showOptions(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedValue != null ? AppColors.primary600 : colorTheme.onSurface,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              displayText,
              style: textTheme.bodySmall?.copyWith(
                color: selectedValue != null ? AppColors.primary600 : null,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_drop_down, size: 18, color: colorTheme.onSurface),
          ],
        ),
      ),
    );
  }

  void _showOptions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'All',
                style: textTheme.bodyMedium?.copyWith(
                  color: selectedValue == null ? AppColors.primary600 : null,
                ),
              ),
              onTap: () {
                onSelected(null);
                Navigator.pop(context);
              },
            ),
            ...options.map(
              (option) => ListTile(
                title: Text(
                  option,
                  style: textTheme.bodyMedium?.copyWith(
                    color: selectedValue == option ? AppColors.primary600 : null,
                  ),
                ),
                onTap: () {
                  onSelected(option);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
