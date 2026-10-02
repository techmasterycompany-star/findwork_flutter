import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'guide_card.dart';

class CareerGuidesSection extends StatelessWidget {
  const CareerGuidesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).growYourFreelanceCareer,
          style: Theme.of(context).textTheme.titleLarge,
        ),

        const SizedBox(height: 4),

        Text(
          S.of(context).freelanceCareerDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        AppSpacing.vertical12,

        GuideCard(
          category: S.of(context).category1,
          readTime: S.of(context).readTime1,
          title: S.of(context).title1,
        ),

        AppSpacing.vertical12,

        GuideCard(
          category: S.of(context).category2,
          readTime: S.of(context).readTime2,
          title: S.of(context).title11,
        ),

        AppSpacing.vertical12,
        GuideCard(
          category: S.of(context).category3,
          readTime: S.of(context).readTime3,
          title: S.of(context).title12,
        ),
      ],
    );
  }
}
