import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

class UserSteps extends StatelessWidget {
  final String message;
  final int currentStep;
  const UserSteps({super.key, required this.message, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message, style: AppTypography.h2.copyWith(fontSize: 28)),
        AppSpacing.vertical8,

        Row(
          mainAxisAlignment: .spaceBetween,
          spacing: AppSpacing.cardGapSmall,
          children: [
            _buildSteps(context, '1', currentStep == 1 || currentStep == 2 || currentStep == 3 ? true : false),
            _buildSteps(context, '2', currentStep == 2  || currentStep == 3 ? true : false),
            _buildSteps(context, '3', currentStep == 3 ? true : false),
          ],
        ),

        Row(
          mainAxisAlignment: .spaceBetween,

          spacing: AppSpacing.cardGapSmall,
          children: [Text('Account'), Text('Profile'), Text('Review')],
        ),
      ],
    );
  }
}

Widget _buildSteps(BuildContext context, String number, bool isPage) {
  final colorTheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;

  return Container(
    padding: EdgeInsets.all(AppSpacing.cardGapSmall),
    decoration: BoxDecoration(
      color: isPage ? colorTheme.primary : AppColors.gray200,
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      number,
      style: textTheme.bodySmall?.copyWith(
        color: isPage ? colorTheme.onPrimary : AppColors.gray500,
      ),
    ),
  );
}
