import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/homepage_employer/stat_card.dart';
import 'package:findwork_flutter/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerHomeHeroSection extends StatelessWidget {
  const EmployerHomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.primary50,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primary600.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary600,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Premium Hiring Active',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.primary600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Headings
          Text(
            'Welcome back, TechVentures',
            style: AppTypography.h3.copyWith(
              color: AppColors.neutral900,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your current open roles are attracting top-tier engineering and design talent. Review your timeline and applicants below.',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral500,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20.h),

          // Company Mini Card
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.neutral200),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral900.withValues(alpha: 0.04),
                  blurRadius: 10.r,
                  offset: Offset(0, 2.h),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary100,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.neutral200),
                  ),
                  child: Icon(
                    Icons.business_rounded,
                    color: AppColors.primary600,
                    size: 26.sp,
                  ),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TechVentures Inc.',
                        style: AppTypography.cardTitle.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Enterprise Tech & SaaS Solutions',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.success500.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              'Verified',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.success600,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Billing & Usage',
                            style: AppTypography.caption.copyWith(
                              color: AppColors.primary600,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Quick Recruiter Stats using public StatCard
          Row(
            children: [
              Expanded(
                child: StatCard(
                  value: '4',
                  valueColor: AppColors.primary600,
                  label: 'Active job posts',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: StatCard(
                  value: '182',
                  valueColor: AppColors.success500,
                  label: 'Total applicants',
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: StatCard(
                  value: '12',
                  valueColor: AppColors.warning500,
                  label: 'To interview',
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Actions Row using CustomButton
          Column(
            children: [
              CustomButton(
                text: 'Post a Job Free',
                icon: Icons.add_circle_outline_rounded,
                variant: CustomButtonVariant.primary,
                height: 46.h,
                width: double.infinity,
                onPressed: () {},
              ),
              SizedBox(height: 12.h),
              CustomButton(
                text: 'Browse Candidates',
                icon: Icons.person_search_outlined,
                variant: CustomButtonVariant.outlined,
                height: 44.h,
                width: double.infinity,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
