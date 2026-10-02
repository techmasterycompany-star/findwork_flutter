import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class SkillRow extends StatelessWidget {
  final String skillName;
  final String growth;
  final String jobs;

  const SkillRow({
    super.key,
    required this.skillName,
    required this.growth,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(skillName, style: Theme.of(context).textTheme.labelLarge),

                const SizedBox(height: 2),

                Text(
                  growth,
                  style: const TextStyle(
                    color: AppColors.success400,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              '$jobs ${S.of(context).jobs}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
