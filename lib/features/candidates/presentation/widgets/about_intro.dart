import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AboutIntro extends StatelessWidget {
  const AboutIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final points = [
      'Zero commission on first 3 projects',
      'Secure escrow payments',
      '24/7 dispute resolution support',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Mission',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppSpacing.vertical20,
        Text(
          'Empowering Millions to Work on Their \nOwn Terms',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        AppSpacing.vertical12,

        Text(
          'We believe that work should have no borders. Whether'
          'you are a developer, designer, writer, or consultant — your'
          'skills deserve a global stage, and businesses deserve'
          'access to the world\'s best talent',
          style: theme.textTheme.bodyMedium,
        ),
        AppSpacing.vertical8,
        Text(
          'Job4U removes friction between talent and opportunity.'
          'Our platform handles contracts, payments, and trust — so'
          'you can focus on what you do best.',
          style: theme.textTheme.bodyMedium,
        ),

        AppSpacing.vertical20,

        ...points.map(
          (point) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                ),
                AppSpacing.horizontal8,
                Expanded(child: Text(point, style: theme.textTheme.bodyMedium)),
              ],
            ),
          ),
        ),

        AppSpacing.vertical12,

        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'asset/images/office.png',
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
