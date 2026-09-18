import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'skill_row.dart';

class HighDemandSkillsCard extends StatelessWidget {
  const HighDemandSkillsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).highDemandSkills,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 4),

          Text(
            S.of(context).topMatchingSkills,
            style: Theme.of(context).textTheme.bodySmall,
          ),

          AppSpacing.vertical12,
          SkillRow(
            skillName: S.of(context).skillName1,
            growth: S.of(context).growth1,
            jobs: S.of(context).jobs1,
          ),

          Divider(height: 1, color: Colors.grey.shade200),

          SkillRow(
            skillName: S.of(context).skillName2,
            growth: S.of(context).growth2,
            jobs: S.of(context).jobs2,
          ),

          Divider(height: 1, color: Colors.grey.shade200),

          SkillRow(
            skillName: S.of(context).skillName3,
            growth: S.of(context).growth3,
            jobs: S.of(context).jobs3,
          ),
        ],
      ),
    );
  }
}
