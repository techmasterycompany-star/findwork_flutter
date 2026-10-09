import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantStatusDropdown extends StatelessWidget {
  final String status;
  final ValueChanged<String?> onChanged;

  const ApplicantStatusDropdown({
    Key? key,
    required this.status,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Application Status',
          style: AppTypography.smallText.copyWith(color: AppColors.neutral500),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.primary300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: status,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primary600),
              items: ['Under Review', 'Shortlisted', 'Interviewing', 'Rejected']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: AppTypography.smallText.copyWith(
                            color: AppColors.primary700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
