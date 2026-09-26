import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/widgets/candidate_skill_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateOverviewInfo extends StatelessWidget {
  const CandidateOverviewInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Candidate Overview',
                      style: AppTypography.cardTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildInfoTile(
                      icon: Icons.business_center_outlined,
                      label: 'Industry',
                      value: 'Software / Development',
                    ),
                    SizedBox(height: 12.h),
                    _buildInfoTile(
                      icon: Icons.payments_outlined,
                      label: 'Expected Salary',
                      value: '\$120k -\$140k/year',
                    ),
                    SizedBox(height: 12.h),
                    _buildInfoTile(
                      icon: Icons.work_history_outlined,
                      label: 'Experience',
                      value: '5+ Years',
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Info',
                      style: AppTypography.cardTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildInfoTile(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: '+1 555 123 4567',
                    ),
                    SizedBox(height: 12.h),
                    _buildInfoTile(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: 'Sarah@gmail.com',
                    ),
                    SizedBox(height: 12.h),
                    _buildInfoTile(
                      icon: Icons.language_outlined,
                      label: 'Website',
                      value: 'Sarah.dev',
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Objective',
            style: AppTypography.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.primary50.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.primary100),
            ),
            child: Text(
              '"To obtain a position in the field of software engineering that utilizes my skills and experience."',
              textAlign: TextAlign.center,
              style: AppTypography.body.copyWith(
                color: AppColors.neutral800,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Skills Specialization:',
            style: AppTypography.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: const [
              CandidateSkillChip(label: 'Web Design'),
              CandidateSkillChip(label: 'User Experience'),
              CandidateSkillChip(label: 'User Interface Design'),
              CandidateSkillChip(label: 'Figma'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            size: 18.sp,
            color: AppColors.primary600,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTypography.caption.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              Text(
                value,
                style: AppTypography.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.neutral900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
