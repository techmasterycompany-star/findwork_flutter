import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class ApplyCvCard extends StatelessWidget {
  const ApplyCvCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.error200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.error400, width: 1.2),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        titleAlignment: ListTileTitleAlignment.top,

        leading: const Icon(Icons.error_outline),

        title: Text(
          'Resume / CV',
          style: Theme.of(context).textTheme.titleMedium,
        ),

        subtitle: Text(
          'Not filled in',
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.edit_outlined),
            AppSpacing.horizontal8,
            Text('Edit', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
