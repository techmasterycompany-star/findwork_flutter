import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/company_results.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_pagination.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/find_job_search.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ListCompaniesScreen extends StatefulWidget {
  const ListCompaniesScreen({super.key});

  @override
  State<ListCompaniesScreen> createState() => _ListCompaniesScreenState();
}

class _ListCompaniesScreenState extends State<ListCompaniesScreen> {
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
                                // ToDo
                              },
                              text: 'Companies',
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
                              text: 'Discover Top ',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            TextSpan(
                              text: '\nCompanies',
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
                "Explore leading companies, learn about their culture, \nand find your next career opportunity.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              JobSearchBar(titel: 'Company title'),
              AppSpacing.vertical12,
              CompanyResults(),
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
