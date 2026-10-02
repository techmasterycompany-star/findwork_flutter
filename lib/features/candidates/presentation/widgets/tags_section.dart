import 'package:findwork_flutter/features/candidates/presentation/widgets/job-tag.dart';
import 'package:flutter/material.dart';

class TagsSection extends StatelessWidget {
  const TagsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tags = [
      'Contract',
      'Remote',
      'Full-time',
      'Entry level',
      '0-1 years experience',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 9),

        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: tags
              .map(
                (tag) => JobTag(
              label: tag,
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}