import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';

class PillButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PillButton({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Material(
      color: isSelected ? AppColors.primary400 : colorTheme.surface,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sectionInternalPadding,
            vertical: AppSpacing.cardGapSmall,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: isSelected ? 30 : 20,
                color: isSelected ? AppColors.white : colorTheme.onSurface,
              ),
              AppSpacing.horizontal12,
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? AppColors.white : colorTheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
