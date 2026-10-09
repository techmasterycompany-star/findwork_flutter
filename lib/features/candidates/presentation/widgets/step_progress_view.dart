import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class StepProgressView extends StatelessWidget {
  /// رقم الخطوة الحالية النشطة
  final int currentStep;

  /// عناوين الخطوات
  final List<String> steps;

  const StepProgressView({
    super.key,
    required this.currentStep,
    this.steps = const ['Account', 'Profile', 'Review', 'Review', 'Review'],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final activeColor = AppColors.primary600;
    final inactiveColor = AppColors.gray400;

    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        // الدائرة + اسم الخطوة
        if (index.isEven) {
          final stepIndex = index ~/ 2;
          final stepNumber = stepIndex + 1;

          final isActive = stepNumber <= currentStep;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? activeColor : Colors.transparent,
                  border: Border.all(
                    color: isActive ? activeColor : inactiveColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$stepNumber',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isActive ? AppColors.white : inactiveColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              AppSpacing.vertical8,

              Text(
                steps[stepIndex],
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isActive ? activeColor : inactiveColor,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          );
        }

        // الخط بين الخطوات
        final lineIndex = (index - 1) ~/ 2;

        final isLineActive = lineIndex + 1 < currentStep;

        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 2,
            color: isLineActive ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
