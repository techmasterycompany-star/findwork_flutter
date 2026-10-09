import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:flutter/material.dart';

import 'widgets/employer_home_active_jobs_section.dart';
import 'widgets/employer_home_cta_banner.dart';
import 'widgets/employer_home_hero_section.dart';
import 'widgets/employer_home_hiring_activity_section.dart';
import 'widgets/employer_home_matched_candidates_section.dart';
import 'widgets/employer_home_talent_spotlight_section.dart';
import 'widgets/employer_home_upgrade_pro_section.dart';

class HomepageEmployer extends StatelessWidget {
  const HomepageEmployer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            EmployerHomeHeroSection(),
            EmployerHomeActiveJobsSection(),
            EmployerHomeCtaBanner(),
            EmployerHomeMatchedCandidatesSection(),
            EmployerHomeHiringActivitySection(),
            EmployerHomeTalentSpotlightSection(),
            EmployerHomeUpgradeProSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
