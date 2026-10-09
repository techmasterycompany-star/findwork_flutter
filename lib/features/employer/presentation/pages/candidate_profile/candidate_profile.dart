import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_background.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_cta_banner.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_header.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_overview_info.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_references.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_summary.dart';
import 'package:flutter/material.dart';

class CandidateProfile extends StatelessWidget {
  const CandidateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CandidateHeader(
              onContact: () {},
              onSave: () {},
              onDownloadCv: () {},
            ),
            const CandidateOverviewInfo(),
            const CandidateSummary(),
            const CandidateBackground(),
            const CandidateReferences(),
            const CandidateCtaBanner(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
