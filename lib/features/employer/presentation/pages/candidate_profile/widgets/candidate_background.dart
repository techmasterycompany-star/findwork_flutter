import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateBackground extends StatelessWidget {
  const CandidateBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Background',
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary600,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Career journey',
                style: AppTypography.cardTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral900,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.primary200),
                ),
                child: Text(
                  '5+ years experience',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          Text(
            'Education',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'University of California, Berkeley',
            style: AppTypography.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'California • Computer Science',
            style: AppTypography.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primary600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Earned her degree in Computer Science, building a strong foundation in algorithms, distributed systems, and software architecture that continues to shape her engineering approach today.',
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 24.h),

          Text(
            'Work experience',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 12.h),
          _buildExperienceItem(
            title: 'Software Engineer',
            company: 'XYZ Corporation',
            dateRange: '2019 — Present',
            description:
                'Leading development of scalable web applications and cloud based services in San Francisco, California.',
          ),
          SizedBox(height: 16.h),
          _buildExperienceItem(
            title: 'Junior Software Engineer',
            company: 'ABC Corporation',
            dateRange: '2018 — 2019',
            description:
                'Contributed to feature development and quality assurance across cross-functional teams in San Jose, California.',
          ),
          SizedBox(height: 24.h),

          Text(
            'Certification',
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 12.h),
          _buildCertificationItem(
            badgeLabel: '2022',
            subLabel: 'Associate',
            title: 'AWS Certified Solutions Architect',
            description:
                'Validated expertise in designing cloud solutions on AWS, focusing on cost optimization, security, and high performance.',
            iconData: Icons.cloud_done_outlined,
          ),
          SizedBox(height: 16.h),
          _buildCertificationItem(
            badgeLabel: '2021',
            subLabel: 'Programmer',
            title: 'Java SE 8 Programmer',
            description:
                'Demonstrated proficiency in core Java language features, object-oriented design, and standard library APIs.',
            iconData: Icons.code_rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String dateRange,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.cardTitle.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.neutral900,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          company,
          style: AppTypography.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary600,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          description,
          style: AppTypography.smallText.copyWith(
            color: AppColors.neutral600,
            height: 1.5,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            dateRange,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificationItem({
    required String badgeLabel,
    required String subLabel,
    required String title,
    required String description,
    required IconData iconData,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: Icon(
            iconData,
            color: AppColors.primary600,
            size: 24.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.neutral100,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      badgeLabel,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral700,
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    subLabel,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                title,
                style: AppTypography.cardTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                description,
                style: AppTypography.smallText.copyWith(
                  color: AppColors.neutral600,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
