import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_pagination.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/is_closed_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_related.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCard(
                          borderRadius: 6,
                          height: 24,
                          width: 135,
                          backgroundColor: AppColors.primary100,
                          child: Row(
                            children: [
                              ActiveJobsBadge(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CandidateHome(),
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
                                  // ToDo
                                },
                                text: S.of(context).savedJobs,
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
                                text: 'Saved Jobs ',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              TextSpan(
                                text: '(24 saved)',
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
                  ),
                  AppSpacing.horizontal24,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(
                          "asset/images/image4.png",
                          width: 135,
                          height: 86,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Keep track of jobs you're interested in \nand apply when you're ready",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSpacing.vertical20,
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: JobsSearch(
                        hintText: 'Search Saved Jobs',
                        prefixIcon: Icon(Icons.search_outlined),
                      ),
                    ),
                    ActiveJobsBadge(
                      text: "Find Job",
                      textStyle: TextStyle(color: AppColors.white),
                      circular: 8,
                      backGround: AppColors.primary600,
                      border: Border.all(color: AppColors.gray400, width: 1.2),
                    ),
                  ],
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
              AppSpacing.vertical12,
              JobCard(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                imagePath: "asset/images/image1.png",
                location: 'Canada',
                salary: "\$40000 - \$42000",
                postedTime: '1 hour ago',
                typeJob: 'Full-Time',
                jobplace: 'Hybrid',
                jobDescription:
                    'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                    'do eiusmod tempor et...',
                onDetails: () {},
                onBookmark: () {},
              ),
              AppSpacing.vertical12,
              IsClosedCard(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                imagePath: 'asset/images/image1.png',
                location: 'Canada',
                salary: '\$40000-\$42000',
                postedTime: '1 hour ago',
                typeJob: 'Full-Time',
                jobplace: 'Hybrid',
                jobDescription:
                    'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                    'do eiusmod tempor et...',
                onDetails: () {},
                status: JobStatus.closed,
              ),
              AppSpacing.vertical12,
              IsClosedCard(
                title: 'UI/UX Designer',
                company: 'Tech Company',
                imagePath: 'asset/images/image1.png',
                location: 'Canada',
                salary: '\$40000-\$42000',
                postedTime: '1 hour ago',
                typeJob: 'Full-Time',
                jobplace: 'Hybrid',
                jobDescription:
                    'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed '
                    'do eiusmod tempor et...',
                onDetails: () {},
                status: JobStatus.applied,
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
              AppSpacing.vertical32,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
