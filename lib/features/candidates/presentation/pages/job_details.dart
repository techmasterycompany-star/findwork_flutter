import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/find_job_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_related.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/company_card.dart';
import '../widgets/description_bullet.dart';
import '../widgets/job_details_section.dart';
import '../widgets/job_overview_card.dart';
import '../widgets/skills_specialization_card.dart';
import '../widgets/tags_section.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSpacing.vertical12,
                      CustomCard(
                        borderRadius: 6,
                        height: 24,
                        width: 210,
                        backgroundColor: AppColors.primary100,
                        child: Row(
                          children: [
                            ActiveJobsBadge(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CandidateHome(),
                                  ),
                                );
                              },
                              text: S.of(context).Home,
                              textStyle: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                              color: AppColors.primary500,
                            ),
                            ActiveJobsBadge(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FindJobScreen(),
                                  ),
                                );
                              },
                              text: S.of(context).FindJobs,
                              textStyle: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                              color: AppColors.primary500,
                            ),
                            ActiveJobsBadge(
                              onPressed: () {
                                // ToDo
                              },
                              text: S.of(context).JobDetails,
                              textStyle: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSpacing.vertical8,
                    ],
                  ),
                  AppSpacing.horizontal12,
                ],
              ),
              Stack(
                children: [
                  JobCard(
                    boolBorder: false,
                    title: S.of(context).uiUxDesigner,
                    company: S.of(context).techCompany,
                    imagePath: "asset/images/image1.png",
                    location: S.of(context).canada,
                    salary: "\$40000 - \$42000",
                    postedTime: S.of(context).oneHourAgo,
                    typeJob: S.of(context).fullTime,
                    jobplace: S.of(context).hybrid,
                    jobDetails: S.of(context).applyThisJob,
                    onDetails: () {},
                    onBookmark: () {},
                  ),
                  Positioned(
                    left: 230,
                    child: Image.asset(
                      "asset/images/image3.png",
                      width: 135,
                      height: 86,
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical12,
              CustomCard(
                padding: EdgeInsets.all(14),
                backgroundColor: Theme.of(context).cardTheme.color,
                border: BorderSide(color: AppColors.gray300, width: 1),
                child: Column(
                  children: [
                    JobOverviewCard(),
                    SkillsSpecializationCard(),
                    AppSpacing.vertical12,
                  ],
                ),
              ),
              JobDetailsSection(
                title: S.of(context).overview,
                child: Text(
                  S.of(context).seniorUxDesignerDescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              AppSpacing.vertical12,
              JobDetailsSection(
                title: 'Job Description',
                child: Column(
                  children: [
                    DescriptionBullet(
                      text: 'Develop precise user flows and wireframes.',
                    ),
                    DescriptionBullet(
                      text: 'Create prototypes and conduct usability tests.',
                    ),
                    DescriptionBullet(
                      text: 'Adhere to design system guidelines.',
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical12,
              JobDetailsSection(
                title: 'What we offer',
                child: Column(
                  children: [
                    DescriptionBullet(
                      text: 'Competitive compensation package.',
                    ),
                    DescriptionBullet(text: 'Convenient office location.'),
                    DescriptionBullet(
                      text: 'Significant responsibilities and autonomy.',
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical12,
              TagsSection(),
              AppSpacing.vertical12,
              CompanyCard(
                companyDetails: true,
                companyName: 'Tech Company',
                rating: 4.5,
                overview:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod ut labore et dolore magna aliqua.',

                badge1: 'Global',
                badge1Color: Colors.blue,

                badge2: 'Hiring',
                badge2Color: Colors.green,

                jobs: '50 Jobs open',
                employees: '1,234 employees',
                salaries: '88.1K Salaries',

                logoUrl: 'asset/images/image-cmpony.png',

                onTap: () {
                  // Company Details
                },
              ),
              AppSpacing.vertical12,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Related Jobs',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        ActiveJobsBadge(
                          backGround: AppColors.white,
                          onPressed: () {},
                          text: "View all",
                          textStyle: TextStyle(
                            color: AppColors.primary500,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12,
                          color: AppColors.primary500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical12,
              JobRelated(),
              AppSpacing.vertical12,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
