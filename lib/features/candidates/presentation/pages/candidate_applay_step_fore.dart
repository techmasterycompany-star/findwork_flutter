import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_applay_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_steps_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateApplayStepFore extends StatefulWidget {
  const CandidateApplayStepFore({super.key});

  @override
  State<CandidateApplayStepFore> createState() =>
      _CandidateApplayStepForeState();
}

class _CandidateApplayStepForeState extends State<CandidateApplayStepFore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.vertical20,
                  JobApplayCard(),
                  AppSpacing.vertical20,
                  JobStepsCard(
                    step: 'Step 4 of 5',
                    title: 'Show your work',
                    subTitle:
                        'Share links to past projects, GitHub repos, or your portfolio.',
                    currentStep: 4,
                    onContinue: () {
                      context.push('/CandidateApplayFive');
                    },
                    onBack: () {
                      context.pop();
                    },
                    child: Column(
                      children: [
                        Text(
                          'Include live demos, GitHub repos, Behance, Dribbble, or any relevant past projects. Quality over quantity.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        AppSpacing.vertical12,
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3.2,
                              color: AppColors.gray200,
                            ),
                          ),
                          child: JobsSearch(
                            hintText: 'https://project-1.example.com',
                            prefixIcon: Icon(Icons.link),
                            suffixIcon: Icon(Icons.close),
                          ),
                        ),
                        AppSpacing.vertical12,
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3.2,
                              color: AppColors.gray200,
                            ),
                          ),
                          child: JobsSearch(
                            hintText: 'https://project-2.example.com',
                            prefixIcon: Icon(Icons.link),
                            suffixIcon: Icon(Icons.close),
                          ),
                        ),
                        AppSpacing.vertical12,
                        Row(
                          children: [
                            Icon(Icons.add),
                            AppSpacing.horizontal8,
                            Text(
                              'Add Another Link',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.vertical24,
                ],
              ),
            ),
            AppFooter(),
          ],
        ),
      ),
    );
  }
}
