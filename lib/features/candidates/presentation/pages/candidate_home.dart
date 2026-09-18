import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/candidate_how_it_works.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/candidate_profile_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/career_guides_section.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/high_demand_skills_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/premium_banner.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/stat_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/top_hiring_companies.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class CandidateHome extends StatefulWidget {
  const CandidateHome({super.key});

  @override
  State<CandidateHome> createState() => _CandidateHomeState();
}

class _CandidateHomeState extends State<CandidateHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActiveJobsBadge(
                jobsCount: "12,800",
                text: S.of(context).Active,
                textStyle: TextStyle(color: AppColors.primary600),
                showDot: true,
              ),
              SizedBox(height: 24),
              Text(
                S.of(context).Welcome,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              AppSpacing.vertical12,
              Text(
                S.of(context).welcomeDeception,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSpacing.vertical12,
              SizedBox(
                height: 40,
                width: 382,
                child: JobsSearch(
                  hintText: S.of(context).search,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.gray400,
                  ),
                ),
              ),
              AppSpacing.vertical12,
              Text(
                S.of(context).Popular,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              AppSpacing.vertical12,
              Wrap(
                runSpacing: 8,
                children: [
                  ActiveJobsBadge(
                    onPressed: () {},
                    text: S.of(context).Developer,
                    backGround: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: AppColors.gray300, width: 1),
                  ),
                  AppSpacing.horizontal12,
                  ActiveJobsBadge(
                    onPressed: () {},
                    text: S.of(context).Designer,
                    backGround: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: AppColors.gray300, width: 1),
                  ),
                  AppSpacing.horizontal12,
                  ActiveJobsBadge(
                    onPressed: () {},
                    text: S.of(context).Fullstack,
                    backGround: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: AppColors.gray300, width: 1),
                  ),
                  AppSpacing.horizontal12,
                  ActiveJobsBadge(
                    onPressed: () {},
                    text: S.of(context).TeamLeader,
                    backGround: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: AppColors.gray300, width: 1),
                  ),
                  AppSpacing.horizontal12,

                  ActiveJobsBadge(
                    onPressed: () {},
                    text: S.of(context).Financial,
                    backGround: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: AppColors.gray300, width: 1),
                  ),
                  AppSpacing.horizontal12,
                ],
              ),
              AppSpacing.vertical24,
              Row(
                children: [
                  Expanded(
                    child: CandidateProfileCard(
                      name: S.of(context).name,
                      jobTitle: S.of(context).jobTitle,
                      imageUrl: S.of(context).imageUrl,
                    ),
                  ),
                ],
              ),

              AppSpacing.vertical24,
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      value: "14",
                      label: S.of(context).label,
                      valueColor: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(width: 6),
                  Expanded(
                    child: StatCard(
                      value: "6",
                      label: S.of(context).label2,
                      valueColor: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 6),
                  Expanded(
                    child: StatCard(
                      value: "3",
                      label: S.of(context).label3,
                      valueColor: Colors.orange,
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical32,
              JobCard(
                title: S.of(context).title,
                company: S.of(context).company,
                imagePath: "asset/images/image1.png",
                location: S.of(context).location,
                salary: "\$60,000 - \$80,000",
                postedTime: S.of(context).postedTime,
                typeJob: S.of(context).typeJob,
                jobplace: S.of(context).jobplace,
                jobDescription: S.of(context).jobDescription,
                onDetails: () {},
                onBookmark: () {},
              ),
              AppSpacing.vertical32,
              JobCard(
                title: S.of(context).title2,
                company: S.of(context).company2,
                imagePath: "asset/images/image1.png",
                location: S.of(context).location2,
                salary: "\$60,000 - \$80,000",
                postedTime: S.of(context).postedTime2,
                typeJob: S.of(context).typeJob2,
                jobplace: S.of(context).jobplace2,
                jobDescription: S.of(context).jobDescription2,
                onDetails: () {},
                onBookmark: () {},
              ),
              AppSpacing.vertical24,
              Center(
                child: ActiveJobsBadge(
                  backGround: Theme.of(context).colorScheme.surface,
                  onPressed: () {},
                  text: S.of(context).recommendations,
                  textStyle: TextStyle(
                    color: AppColors.primary700,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              AppSpacing.vertical24,

              // How Job4U Works + Active Applications
              CandidateHowItWorks(
                onCreateAccount: () {
                  // TODO
                },
                onUploadCv: () {
                  // TODO
                },
                onFindJob: () {
                  // TODO
                },
                onApplyJob: () {
                  // TODO
                },
                onInterviewPrep: () {
                  // TODO
                },
              ),
              AppSpacing.vertical20,
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).topHiringCompanies,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),

                    const SizedBox(height: 6),

                    Text(
                      S.of(context).topEmployersDescription,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              AppSpacing.vertical20,
              TopHiringCompanies(
                companyName: S.of(context).companyName1,
                rating: 5,
                employees: "1.234",
                jobsOpen: "50",
              ),
              TopHiringCompanies(
                companyName: S.of(context).companyName2,
                rating: 5,
                employees: "300",
                jobsOpen: "20",
              ),
              AppSpacing.vertical20,
              Center(
                child: ActiveJobsBadge(
                  backGround: Theme.of(context).colorScheme.surface,
                  onPressed: () {},
                  text: S.of(context).browseAllCompanies,
                  textStyle: TextStyle(
                    color: AppColors.primary700,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              AppSpacing.vertical20,

              CareerGuidesSection(),
              AppSpacing.vertical20,

              HighDemandSkillsCard(),
              AppSpacing.vertical20,
              const PremiumBanner(),

              AppSpacing.vertical20,
              const AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
