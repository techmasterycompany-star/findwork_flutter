import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';

class AboutFooter extends StatelessWidget {
  const AboutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.primary950),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSpacing.vertical64,
          Text(
            'Join us today and discover thousands of jobs',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppSpacing.vertical12,
          Text(
            'Create your free account and connect with top employers who are looking for someone exactly like you.',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          AppSpacing.vertical12,
          Row(
            children: [
              ActiveJobsBadge(
                onPressed: () {},
                circular: 8,
                backGround: AppColors.primary500,
                text: 'Get Started — It\'s Free',
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacing.horizontal12,
              ActiveJobsBadge(
                onPressed: () {},
                circular: 8,
                border: Border.all(color: AppColors.white, width: 1),
                backGround: AppColors.primary950,
                text: 'Browse Jobs',
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          AppSpacing.vertical12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 18,
                color: AppColors.success400,
              ),
              AppSpacing.horizontal8,
              Text(
                'No spam, ever',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              AppSpacing.horizontal24,
              Icon(
                Icons.check_circle_outline,
                size: 18,
                color: AppColors.success400,
              ),
              AppSpacing.horizontal8,
              Text(
                'Cancel anytime',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          AppSpacing.vertical12,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 18,
                color: AppColors.success400,
              ),
              AppSpacing.horizontal8,
              Text(
                '50,000+ active users',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          AppSpacing.vertical64,
        ],
      ),
    );
  }
}
