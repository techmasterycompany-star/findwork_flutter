import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_applay_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_steps_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateApplayStepTwo extends StatelessWidget {
  const CandidateApplayStepTwo({super.key});

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
                    step: 'Step 2 of 5',
                    title: 'Write your cover letter',
                    subTitle:
                        'This is your chance to stand out. Write a compelling, personal introduction.',
                    currentStep: 2,
                    onContinue: () {
                      context.push('/CandidateApplayStepThree');
                    },
                    onBack: () {
                      context.pop();
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 360,
                          height: 300,
                          margin: EdgeInsets.symmetric(vertical: 16),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(
                              width: 3.1,
                              color: AppColors.gray200,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Dear Luminary Digital team,\n \n'
                                'I\'m excited to apply for the Senior React Developer position. With over 6 years of experience building scalable React applications across fintech and SaaS, I\'m confident I can lead your front-end architecture effectively.\n\n'
                                'What drows me most to Luminary Digital is your commitment to craft and remote-first culfure...',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '0 / 2000',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
