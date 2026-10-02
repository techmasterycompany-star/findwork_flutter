import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateReferences extends StatelessWidget {
  const CandidateReferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trusted by',
            style: AppTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary600,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'References',
            style: AppTypography.cardTitle.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.neutral900,
            ),
          ),
          SizedBox(height: 16.h),
          _buildReferenceCard(
            refCode: 'Ref. #101',
            company: 'XYZ Corporation',
            quote:
                '"Sarah is one of the most talented engineers I\'ve worked with. Her work ethic and technical skills consistently exceed expectations."',
            authorName: 'Mark Jones',
            authorRole: 'Senior Software Engineer',
            iconColor: AppColors.primary600,
          ),
          SizedBox(height: 16.h),
          _buildReferenceCard(
            refCode: 'Ref. #102',
            company: 'ABC Corporation',
            quote:
                '"Sarah\'s grace under pressure and her problem-solving ability made her an invaluable asset to our developer team."',
            authorName: 'Emily Chen',
            authorRole: 'Chief Technology Officer',
            iconColor: AppColors.success500,
          ),
          SizedBox(height: 16.h),
          _buildReferenceCard(
            refCode: 'Ref. #103',
            company: 'UC Berkeley',
            quote:
                '"Sarah was among the top students in my class — curious, disciplined, and always the first to help her peers solve problems."',
            authorName: 'Rachel Fitzgerald',
            authorRole: 'Computer Science Lecturer',
            iconColor: AppColors.warning500,
          ),
        ],
      ),
    );
  }

  Widget _buildReferenceCard({
    required String refCode,
    required String company,
    required String quote,
    required String authorName,
    required String authorRole,
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    refCode,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary600,
                    ),
                  ),
                  Text(
                    company,
                    style: AppTypography.smallText.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.neutral700,
                    ),
                  ),
                ],
              ),
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.format_quote_rounded,
                  color: iconColor,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            quote,
            style: AppTypography.smallText.copyWith(
              color: AppColors.neutral700,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            authorName,
            style: AppTypography.smallText.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary600,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            authorRole,
            style: AppTypography.caption.copyWith(
              color: AppColors.neutral500,
            ),
          ),
        ],
      ),
    );
  }
}
