import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/application_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/how_it_works_step.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class CandidateHowItWorks extends StatelessWidget {
  final VoidCallback? onCreateAccount;
  final VoidCallback? onUploadCv;
  final VoidCallback? onFindJob;
  final VoidCallback? onApplyJob;

  final VoidCallback? onInterviewPrep;

  const CandidateHowItWorks({
    super.key,
    this.onCreateAccount,
    this.onUploadCv,
    this.onFindJob,
    this.onApplyJob,
    this.onInterviewPrep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          padding: const EdgeInsets.fromLTRB(22, 32, 22, 28),
          backgroundColor: AppColors.primary100,
          borderRadius: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).howWorks,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              Text(
                S.of(context).finddreamjob,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 28),

              HowItWorksStep(
                step: S.of(context).step,
                title: S.of(context).title6,
                description: S.of(context).description2,
                icon: Icons.person_add_alt_1_outlined,
                onTap: onCreateAccount,
              ),

              const SizedBox(height: 22),

              HowItWorksStep(
                step: S.of(context).step2,
                title: S.of(context).title7,
                description: S.of(context).description3,
                icon: Icons.file_upload_outlined,
                isActive: true,
                onTap: onUploadCv,
              ),

              const SizedBox(height: 22),

              HowItWorksStep(
                step: S.of(context).step3,
                title: S.of(context).title8,
                description: S.of(context).description4,
                icon: Icons.search,
                onTap: onFindJob,
              ),

              const SizedBox(height: 22),

              HowItWorksStep(
                step: S.of(context).step4,
                title: S.of(context).title9,
                description: S.of(context).description5,
                icon: Icons.verified_outlined,
                onTap: onApplyJob,
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).title10,
                style: Theme.of(context).textTheme.displaySmall,
              ),

              const SizedBox(height: 6),

              Text(
                S.of(context).description6,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              const SizedBox(height: 18),
              ApplicationCard(
                jobTitle: S.of(context).jobTitle1,
                company: S.of(context).company1,
                appliedTime: S.of(context).appliedTime1,
                status: S.of(context).status1,
                onInterviewPrep: onInterviewPrep,
              ),
              const SizedBox(height: 18),

              ApplicationCard(
                jobTitle: S.of(context).jobTitle2,
                company: S.of(context).company3,
                appliedTime: S.of(context).appliedTime2,
                status: S.of(context).status2,
                onInterviewPrep: onInterviewPrep,
              ),
              const SizedBox(height: 18),

              ApplicationCard(
                jobTitle: S.of(context).jobTitle3,
                company: S.of(context).company4,
                appliedTime: S.of(context).appliedTime3,
                status: S.of(context).status3,
                onInterviewPrep: onInterviewPrep,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
