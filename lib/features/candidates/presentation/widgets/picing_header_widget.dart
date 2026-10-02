import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';

class PicingHeaderWidget extends StatelessWidget {
  const PicingHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'PRICING PLANES',
          style: TextStyle(
            color: AppColors.primary500,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          'Choose Your Path',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        AppSpacing.vertical12,
        Text(
          ' To Career Success',
          style: TextStyle(
            color: AppColors.primary500,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          'Get the tools you need to stand out, connect with employers, and find your next opportunity.',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        AppSpacing.vertical32,
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: ActiveJobsBadge(
                  onPressed: () {},
                  circular: 8,
                  backGround: AppColors.primary500,
                  text: 'Monthly',
                  textStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppSpacing.horizontal12,
              Expanded(
                child: ActiveJobsBadge(
                  circular: 8,
                  onPressed: () {},
                  backGround: AppColors.white,
                  text: 'Yearly',
                  textStyle: TextStyle(
                    color: AppColors.primary700,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppSpacing.horizontal12,
              Expanded(
                child: ActiveJobsBadge(
                  onPressed: () {},
                  circular: 8,
                  backGround: AppColors.primary100,
                  text: 'Save 20%',
                  textStyle: TextStyle(
                    color: AppColors.primary700,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppSpacing.horizontal8,
            ],
          ),
        ),
      ],
    );
  }
}
