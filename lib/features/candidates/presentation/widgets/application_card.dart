import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String? imagePath;
  final String status;
  final String appliedTime;

  final VoidCallback? onInterviewPrep;

  const ApplicationCard({
    super.key,
    required this.jobTitle,
    required this.company,
    this.imagePath,
    required this.status,
    required this.appliedTime,
    this.onInterviewPrep,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(4),
      border: BorderSide(color: Colors.grey.shade200),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(imagePath ?? "asset/images/image1.png"),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),

                    Text(
                      company,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              ActiveJobsBadge(
                text: status,
                backGround: AppColors.success100,
                textStyle: TextStyle(color: AppColors.success500),
                circular: 4,
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  appliedTime,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextButton(
                onPressed: onInterviewPrep,
                child: Text(
                  S.of(context).View,
                  style: TextStyle(color: AppColors.primary700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
