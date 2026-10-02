import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/data/models/testimonial_card_model.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/list_companies.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/company_details.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/company_results.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/compony_overview.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job4u_brand_info.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_related.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/profile_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/testimonial_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/description_bullet.dart';
import '../widgets/job_details_section.dart';
import '../widgets/skills_specialization_card.dart';

class CompaniesDetails extends StatefulWidget {
  const CompaniesDetails({super.key});

  @override
  State<CompaniesDetails> createState() => _CompaniesDetailsState();
}

class _CompaniesDetailsState extends State<CompaniesDetails> {
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
                        width: 241,
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
                                    builder: (context) =>
                                        const ListCompaniesScreen(),
                                  ),
                                );
                              },
                              text: 'Company',
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
                              text: 'Company Details',
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
              CompanyDetails(
                jobs: '50 Jobs open',
                employees: '1,234 employees',
                salaries: '88.1K Salaries',
              ),
              AppSpacing.vertical12,
              CustomCard(
                padding: EdgeInsets.all(14),
                backgroundColor: Theme.of(context).cardTheme.color,
                border: BorderSide(color: AppColors.gray300, width: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponyOverview(),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Follow Us ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Job4UBrandInfo(
                              socialBackgroundColor: AppColors.primary100,
                              socialIconColor: AppColors.primary600,
                              socialBorderRadius: 6,
                              onFacebook: () {},
                              onTwitter: () {},
                              onLinkedIn: () {},
                              onGithub: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    SkillsSpecializationCard(),
                    AppSpacing.vertical12,
                  ],
                ),
              ),
              AppSpacing.vertical12,
              JobDetailsSection(
                title: 'About Company ',
                child: Text(
                  'ATech Company is a leading provider of enterprise-level technology solutions for businesses of all sizes. We specialize in cloud computing, data analytics, and cybersecurity services.'
                  ' Our team of experienced professionals is dedicated to delivering high-quality solutions that exceed our clients\' expectations.'
                  ' We have a proven track record of success and are committed to helping our clients achieve their goals through innovative and reliable technology solutions.'
                  'Tech Company is a leading provider of enterprise-level technology solutions for businesses of all sizes. '
                  'We specialize in cloud computing, data analytics, and cybersecurity services. Our team of experienced professionals is dedicated to delivering high-quality solutions that exceed our clients\' expectations. '
                  'We have a proven track record of success and are committed to helping our clients achieve their goals through innovative and reliable technology solutions.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              AppSpacing.vertical12,
              JobDetailsSection(
                title: 'Company Culture ',
                child: Text(
                  'At Tech Company, we value teamwork, collaboration, and innovation. '
                  'Our employees are encouraged to think creatively and work together to find the best solutions for our clients.'
                  ' We are committed to creating a positive and inclusive work environment where everyone feels valued and respected.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              AppSpacing.vertical12,
              JobDetailsSection(
                title: 'Job Description',
                child: Column(
                  children: [
                    DescriptionBullet(
                      text: ' Competitive salary and benefits package',
                    ),
                    DescriptionBullet(
                      text: ' Comprehensive health and dental insurance',
                    ),
                    DescriptionBullet(
                      text: '401(k) retirement plan with company match',
                    ),
                    DescriptionBullet(
                      text: 'Paid time off and flexible work hours',
                    ),
                    DescriptionBullet(
                      text:
                          ' Professional development and training opportunities',
                    ),
                    DescriptionBullet(
                      text: 'Employee recognition and awards programs',
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical12,
              TestimonialCard(
                testimonial: TestimonialCardModel(
                  review:
                      'When I applied for a position at BMW, I knew I was about to experience one of the most challenging job interviews of my career. But what I didn’t expect was the incredible combination of professionalism, creativity, and team culture throughout the process.',
                  name: 'Marvin McKinney',
                  role: 'Job Seeker',
                  image: 'asset/images/profile-image2.png',
                ),
              ),
              AppSpacing.vertical12,
              TestimonialCard(
                testimonial: TestimonialCardModel(
                  review:
                      'When I applied for a position at BMW, I knew I was about to experience one of the most challenging job interviews of my career. But what I didn’t expect was the incredible combination of professionalism, creativity, and team culture throughout the process.',
                  name: 'Marvin McKinney',
                  role: 'Job Seeker',
                  image: 'asset/images/profile-image2.png',
                ),
              ),
              AppSpacing.vertical12,
              TestimonialCard(
                testimonial: TestimonialCardModel(
                  review:
                      'When I applied for a position at BMW, I knew I was about to experience one of the most challenging job interviews of my career. But what I didn’t expect was the incredible combination of professionalism, creativity, and team culture throughout the process.',
                  name: 'Marvin McKinney',
                  role: 'Job Seeker',
                  image: 'asset/images/profile-image2.png',
                ),
              ),
              AppSpacing.vertical12,

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Open Jobs',
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ListCompaniesScreen(),
                              ),
                            );
                          },
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
              ProfileCard(
                backImagePath: 'asset/images/back-image.png',
                description:
                    'Product design & strategy studio • Independent since 2016 ',
                name: 'Marvin McKinney',
                location: 'Copenhagen, Denmark',
                imagePath: 'asset/images/profile_image.png',
                website: 'northstar.studio',
              ),
              AppSpacing.vertical12,
              ProfileCard(
                backImagePath: 'asset/images/back-image.png',
                description:
                    'Product design & strategy studio • Independent since 2016 ',
                name: 'Marvin McKinney',
                location: 'Copenhagen, Denmark',
                imagePath: 'asset/images/profile_image.png',
                website: 'northstar.studio',
              ),
              AppSpacing.vertical12,
              ProfileCard(
                backImagePath: 'asset/images/back-image.png',
                description:
                    'Product design & strategy studio • Independent since 2016 ',
                name: 'Marvin McKinney',
                location: 'Copenhagen, Denmark',
                imagePath: 'asset/images/profile_image.png',
                website: 'northstar.studio',
              ),
              AppSpacing.vertical12,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Similar Companies  ',
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
              CompanyResults(),
              AppSpacing.vertical12,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
