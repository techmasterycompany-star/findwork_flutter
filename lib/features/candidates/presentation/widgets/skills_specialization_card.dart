import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/skill_chip.dart';
import 'package:flutter/material.dart';

class SkillsSpecializationCard extends StatelessWidget {
  final bool? boolBorder;
  const SkillsSpecializationCard({super.key, this.boolBorder = false});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Web Design',
      'User Experience',
      'User Interface Design',
      'Figma',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: boolBorder == true
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.white),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills Specialization:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 10),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => SkillChip(label: skill)).toList(),
          ),
        ],
      ),
    );
  }
}
