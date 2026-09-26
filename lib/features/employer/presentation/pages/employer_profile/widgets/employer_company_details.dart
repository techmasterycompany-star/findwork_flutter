import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
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
                  const _SectionLabel(label: '02 / Company details'),
                  SizedBox(height: 8.h),
                  Text(
                    'Built for meaningful work.',
                    style: AppTypography.cardTitle,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary600,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: const BorderSide(color: AppColors.primary200),
                  ),
                ),
                child: Text(
                  'Full profile',
                  style: AppTypography.smallText.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                const _DetailRow(
                  icon: Icons.business_center_outlined,
                  label: 'Industry',
                  value: 'Design & Creative Services',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const _DetailRow(
                  icon: Icons.people_outline_rounded,
                  label: 'Company size',
                  value: '2–10 employees',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const _DetailRow(
                  icon: Icons.flag_outlined,
                  label: 'Founded',
                  value: '2016',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const _DetailRow(
                  icon: Icons.language_rounded,
                  label: 'Language',
                  value: 'English, Danish',
                ),
                Divider(color: AppColors.neutral100, height: 24.h),
                const _DetailRow(
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

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.neutral600,
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: AppColors.neutral400),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            label,
            style: AppTypography.smallText.copyWith(color: AppColors.neutral500),
          ),
        ),
        Text(
          value,
          style: AppTypography.smallText.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.neutral900,
          ),
        ),
      ],
    );
  }
}

