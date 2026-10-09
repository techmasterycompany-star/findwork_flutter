import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/step_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobStepsCard extends StatelessWidget {
  final int currentStep; // الخطوة الحالية (مثلاً 1)
  final Widget child;
  final String? step;
  final String? title;
  final String? subTitle;
  final VoidCallback? onContinue;
  final VoidCallback? onBack;
  const JobStepsCard({
    super.key,
    this.currentStep = 1,
    required this.child,
    this.step,
    this.title,
    this.subTitle,
    this.onContinue,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepProgressView(currentStep: currentStep),
        AppSpacing.vertical20,
        Text(
          step ?? 'Step 1 of 5',
          style: TextStyle(
            color: AppColors.primary600,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          title ?? 'Upload your resume',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        AppSpacing.vertical12,
        Text(
          subTitle ??
              'Let Luminary Digital know who they\'re hiring. Upload your latest CV or resume.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        child,
        AppSpacing.vertical12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onBack,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.gray400,
                    size: 12,
                  ),
                  AppSpacing.horizontal12,
                  Text('Back', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            AppSpacing.horizontal24,
            AppSpacing.horizontal12,
            Text('Save Draft', style: Theme.of(context).textTheme.bodyMedium),
            AppSpacing.horizontal24,
            AppSpacing.horizontal12,
            InkWell(
              onTap: onContinue,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary600,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    AppSpacing.horizontal8,
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
