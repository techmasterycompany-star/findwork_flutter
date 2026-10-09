import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/apply_cv_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_applay_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_steps_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateApplayFive extends StatelessWidget {
  const CandidateApplayFive({super.key});

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
                    step: 'Step 5 of 5',
                    title: 'Ready to apply?',
                    subTitle:
                        'Review everything before sending. You can edit any section below.',
                    currentStep: 5,
                    onContinue: () {
                      context.push('/CandidateApplayStepThree');
                    },
                    onBack: () {
                      context.pop();
                    },
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,

                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: const ApplyCvCard(),
                            );
                          },
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.primary200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By submitting you agree to our ',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Service .\n',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Luminary Digital will receive your full application',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSpacing.vertical20,
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
