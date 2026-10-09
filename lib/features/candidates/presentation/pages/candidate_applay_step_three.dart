import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_applay_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_steps_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateApplayStepThree extends StatefulWidget {
  const CandidateApplayStepThree({super.key});

  @override
  State<CandidateApplayStepThree> createState() =>
      _CandidateApplayStepThreeState();
}

class _CandidateApplayStepThreeState extends State<CandidateApplayStepThree> {
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
                    step: 'Step 3 of 5',
                    title: 'Name your price',
                    subTitle:
                        'Set your expected budget and estimated delivery for this engagement.',
                    currentStep: 3,
                    onContinue: () {
                      context.push('/CandidateApplayStepFore');
                    },
                    onBack: () {
                      context.pop();
                    },
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSpacing.vertical12,

                            Text(
                              'Expected Budget (USD)',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AppSpacing.vertical8,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray200,
                                  width: 3.2,
                                ),
                              ),
                              child: JobsSearch(
                                hintText: '10,000',
                                prefixIcon: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                                suffixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 22,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: 22,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AppSpacing.vertical12,
                            Text(
                              'Employer budget: \$8,000   \$12,000. Competitive bids get priority.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            AppSpacing.vertical12,
                            Text(
                              'Estimated Delivery Time',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AppSpacing.vertical12,
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.gray200,
                                  width: 3.2,
                                ),
                              ),
                              child: JobsSearch(
                                hintText: 'Select Your Estimated Timeframe..',
                                prefixIcon: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 22,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                            ),
                            AppSpacing.vertical12,
                            Text(
                              'Employer expects 4 6 weeks delivery.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            AppSpacing.vertical64,
                            Text(
                              'Additional Notes (Optional)',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            AppSpacing.vertical12,
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 3.2,
                                  color: AppColors.gray200,
                                ),
                              ),
                              child: JobsSearch(),
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
