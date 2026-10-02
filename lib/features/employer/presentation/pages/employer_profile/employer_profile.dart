import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/employer_active_jobs_section.dart';
import 'widgets/employer_company_details.dart';
import 'widgets/employer_cta_card.dart';
import 'widgets/employer_job_info_card.dart';
import 'widgets/employer_profile_cover.dart';
import 'widgets/employer_profile_header.dart';
import 'widgets/employer_reviews_section.dart';
import '../../../../../core/utils/employers_utils/employer_top_bar.dart';
import 'widgets/employer_track_record.dart';

class EmployerProfile extends StatelessWidget {
  const EmployerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      appBar: EmployerTopBar(darkmode: () { }, languge: () {  }, notification: () {  }, menu: () {  },),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EmployerProfileCover(),

            const EmployerProfileHeader(),
            SizedBox(height: 24.h),

            const EmployerJobInfoCard(),
            SizedBox(height: 24.h),

            const EmployerCtaCard(),
            SizedBox(height: 24.h),

            const EmployerTrackRecord(),
            SizedBox(height: 32.h),

            const EmployerCompanyDetails(),
            SizedBox(height: 32.h),

            const EmployerActiveJobsSection(),
            SizedBox(height: 32.h),

            const EmployerReviewsSection(),
            SizedBox(height: 64.h),

            const Footer(),
          ],
        ),
      ),
    );
  }
}