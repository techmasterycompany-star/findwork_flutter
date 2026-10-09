import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

import 'applicant_section_container.dart';

class ApplicantAboutSection extends StatelessWidget {
  final String aboutText;

  const ApplicantAboutSection({
    Key? key,
    required this.aboutText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Cover Letter',
      child: Text(
        aboutText,
        style: AppTypography.smallText.copyWith(
          color: AppColors.neutral600,
          height: 1.5,
        ),
      ),
    );
  }
}
