import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_applay_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_steps_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidateApplayScreen extends StatelessWidget {
  const CandidateApplayScreen({super.key});

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
                    onContinue: () {
                      context.push('/CandidateApplayStepTwo');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 360,
                            height: 150,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                width: 1.2,
                                color: AppColors.gray400,
                              ),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // ToDo
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.gray300,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      size: 30,
                                      color: AppColors.gray700,
                                    ),
                                  ),
                                ),
                                AppSpacing.vertical12,
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Drop your resume here, ',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      TextSpan(
                                        text: 'or browse files',
                                        style: TextStyle(
                                          color: AppColors.primary500,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AppSpacing.vertical8,
                                Text(
                                  'PDF, DOCX, DOC — up to 10 MB',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'or use demo file to preview →',
                          style: Theme.of(context).textTheme.bodySmall,
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
