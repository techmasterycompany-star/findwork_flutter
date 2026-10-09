import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class CandidateProfileCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String imageUrl;
  final VoidCallback? onEdit;

  const CandidateProfileCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.imageUrl,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 120,
      padding: const EdgeInsets.all(12),
      border: BorderSide(color: Colors.grey.shade200),
      child: Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: AssetImage(imageUrl)),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 3),

                Text(jobTitle, style: Theme.of(context).textTheme.bodySmall),

                const Spacer(),

                Row(
                  children: [
                    ActiveJobsBadge(
                      text: S.of(context).activeCandidate,
                      backGround: AppColors.success100,
                      textStyle: TextStyle(color: AppColors.success500),
                    ),

                    const SizedBox(width: 8),
                    ActiveJobsBadge(
                      onPressed: onEdit,
                      text: S.of(context).editProfile,
                      backGround: Theme.of(context).colorScheme.surface,
                      textStyle: TextStyle(color: AppColors.primary700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
