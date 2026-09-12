import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AppDateFilter extends StatelessWidget {
  final String? selectedDate;
  final ValueChanged<String?> onDateChanged;

  const AppDateFilter({
    super.key,
    this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          final dateStr = '${picked.day.toString().padLeft(2, '0')}/'
              '${picked.month.toString().padLeft(2, '0')}/'
              '${picked.year}';
          onDateChanged(dateStr);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: colorTheme.onSurface),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, size: 16, color: colorTheme.onSurface),
            const SizedBox(width: 8),
            Text(
              selectedDate ?? 'Select date',
              style: textTheme.bodySmall?.copyWith(
                color: selectedDate != null ? colorTheme.onSurface : colorTheme.onSurface,
              ),
            ),
            if (selectedDate != null) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => onDateChanged(null),
                child: const Icon(Icons.close, size: 14, color: AppColors.error500),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
