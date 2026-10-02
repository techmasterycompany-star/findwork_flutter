import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'applicant_section_container.dart';

class ApplicantContactSection extends StatelessWidget {
  final String email;
  final String phone;
  final String portfolio;

  const ApplicantContactSection({
    Key? key,
    required this.email,
    required this.phone,
    required this.portfolio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicantSectionContainer(
      title: 'Contact Information',
      child: Column(
        children: [
          _buildRow(Icons.email_outlined, 'Email', email),
          SizedBox(height: 16.h),
          _buildRow(Icons.phone_outlined, 'Phone', phone),
          SizedBox(height: 16.h),
          _buildRow(Icons.language_outlined, 'Portfolio', portfolio),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.neutral500, size: 20.sp),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypography.caption.copyWith(color: AppColors.neutral500),
            ),
            SizedBox(height: 2.h),
            Text(
              value,
              style: AppTypography.smallText.copyWith(
                color: AppColors.neutral800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
