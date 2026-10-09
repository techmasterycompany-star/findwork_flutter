import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/detail_row.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_profile/section_label.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerCompanyDetails extends StatelessWidget {
  const EmployerCompanyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionLabel(label: '02 / Company details'),
                  SizedBox(height: 8.h),
                  Text(
                    'Built for meaningful work.',
                    style: AppTypography.cardTitle,
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Full profile',
                variant: CustomButtonVariant.outlined,
                height: 32.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                fontSize: 12.sp,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral900.withValues(alpha: 0.06),
                  blurRadius: 12.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Column(
              children: [
                const DetailRow(
                  icon: Icons.business_center_outlined,
                  label: 'Industry',
                  value: 'Design & Creative Services',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const DetailRow(
                  icon: Icons.people_outline_rounded,
                  label: 'Company size',
                  value: '2–10 employees',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const DetailRow(
                  icon: Icons.flag_outlined,
                  label: 'Founded',
                  value: '2016',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const DetailRow(
                  icon: Icons.language_rounded,
                  label: 'Language',
                  value: 'English, Danish',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const DetailRow(
                  icon: Icons.location_city_outlined,
                  label: 'Headquarters',
                  value: 'Copenhagen, Denmark',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
