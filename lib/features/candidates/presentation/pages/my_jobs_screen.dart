import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_pagination.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/my_job_card_Item.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyJobsScreen extends StatefulWidget {
  const MyJobsScreen({super.key});

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCard(
                        borderRadius: 6,
                        height: 24,
                        width: 150,
                        backgroundColor: AppColors.primary100,
                        child: Row(
                          children: [
                            ActiveJobsBadge(
                              onPressed: () {
                                Navigator.pop(context);
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
                                // ToDo
                              },
                              text: 'My Jobs',
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
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'My ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            TextSpan(
                              text: 'Jobs',
                              style: TextStyle(
                                color: AppColors.primary500,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.horizontal24,
                  AppSpacing.horizontal12,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(
                          "asset/images/image2.png",
                          width: 135,
                          height: 86,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.vertical12,
              Text(
                'Manage and trace all your job posting in one place',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSpacing.vertical12,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.neutral100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.neutral500, width: 1),
                ),
                child: JobsSearch(
                  hintText: 'Job title',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: AppColors.gray400,
                  ),
                ),
              ),
              AppSpacing.vertical12,
              Row(
                children: [
                  Text(
                    "Job Results (42)",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune,
                      size: 24,
                      color: AppColors.primary500,
                    ),
                  ),
                ],
              ),
              MyJobCardItem(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                logoAssetPath: 'assets/images/figma_logo.png',
                statusText: 'Active',
                workType: 'Full-Time',
                locationType: 'Hybrid',
                applicationsCount: 24,
                onViewApplications: () {
                  // الانتقال لشاشة الطلبات
                },
                onViewJob: () {
                  // الانتقال لتفاصيل الوظيفة
                },
                onOptionsTap: () {
                  // فتح القائمة المنسدلة
                },
              ),
              AppSpacing.vertical12,
              MyJobCardItem(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                logoAssetPath: 'assets/images/figma_logo.png',
                statusText: 'Active',
                workType: 'Full-Time',
                locationType: 'Hybrid',
                applicationsCount: 24,
                onViewApplications: () {
                  // الانتقال لشاشة الطلبات
                },
                onViewJob: () {
                  // الانتقال لتفاصيل الوظيفة
                },
                onOptionsTap: () {
                  // فتح القائمة المنسدلة
                },
              ),
              AppSpacing.vertical12,
              MyJobCardItem(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                logoAssetPath: 'assets/images/figma_logo.png',
                statusText: 'Active',
                workType: 'Full-Time',
                locationType: 'Hybrid',
                applicationsCount: 24,
                onViewApplications: () {
                  // الانتقال لشاشة الطلبات
                },
                onViewJob: () {
                  // الانتقال لتفاصيل الوظيفة
                },
                onOptionsTap: () {
                  // فتح القائمة المنسدلة
                },
              ),
              AppSpacing.vertical12,
              CustomPagination(
                currentPage: currentPage,
                totalPages: 10,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
              AppSpacing.vertical12,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
