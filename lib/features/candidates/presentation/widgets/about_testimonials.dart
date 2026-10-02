import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/data/models/testimonial_card_model.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/testimonial_card.dart';
import 'package:flutter/material.dart';

class AboutTestimonials extends StatelessWidget {
  const AboutTestimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Success stories from our community',
          style: TextStyle(
            color: AppColors.primary600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          'Success starts with the right opportunity',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        AppSpacing.vertical12,
        Text(
          'Real experiences from employers and job seekers',
          style: TextStyle(
            color: AppColors.primary600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        AppSpacing.vertical20,
        Row(
          children: [
            Expanded(
              child: TestimonialCard(
                child: Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                  ],
                ),
                testimonial: TestimonialCardModel(
                  review:
                      'Posting jobs and managing applications has become easier than ever. The platform saves time and helps us organize the hiring process efficiently. ...',
                  name: 'Ahmed Adel',
                  role: 'Job Seeker',
                  image: 'asset/images/profile-image2.png',
                ),
              ),
            ),
            AppSpacing.horizontal12,
            Expanded(
              child: TestimonialCard(
                child: Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                    Icon(Icons.star, color: AppColors.primary500),
                  ],
                ),
                testimonial: TestimonialCardModel(
                  review:
                      'Posting jobs and managing applications has become easier than ever. The platform saves time and helps us organize the hiring process efficiently. ...',
                  name: ' Sara ',
                  role: 'Job Seeker',
                  image: 'asset/images/profile-image2.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
