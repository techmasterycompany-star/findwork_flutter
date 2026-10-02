import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_benefits.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_hero.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_intro.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_journey.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_stats.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_team.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/about_testimonials.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutUsMobileScreen extends StatelessWidget {
  const AboutUsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AboutHero(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.vertical24,

                  const AboutStats(),

                  AppSpacing.vertical24,

                  const AboutIntro(),

                  AppSpacing.vertical24,

                  const AboutBenefits(),

                  AppSpacing.vertical24,

                  const AboutJourney(),

                  AppSpacing.vertical24,

                  const AboutTeam(),

                  AppSpacing.vertical24,

                  const AboutTestimonials(),

                  AppSpacing.vertical24,
                  AboutFooter(),
                  AppSpacing.vertical24,
                  AppFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
