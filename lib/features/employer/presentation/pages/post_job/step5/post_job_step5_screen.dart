import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_company_card.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_compensation_card.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_description_card.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_details_card.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_review_header.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_step5_bottom_bar.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/widgets/post_job_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PostJobStep5Screen extends StatelessWidget {
  const PostJobStep5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: const BoxDecoration(
                color: AppColors.primary600,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.work_outline_rounded,
                color: AppColors.white,
                size: 18.sp,
              ),
            ),
            SizedBox(width: 8.w),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: const [
                  TextSpan(
                    text: 'Job',
                    style: TextStyle(color: AppColors.neutral900),
                  ),
                  TextSpan(
                    text: '4U',
                    style: TextStyle(color: AppColors.primary600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PostJobStepper(currentStep: 5),
                    SizedBox(height: 24.h),
                    Text(
                      'Step 5: Review & Publish',
                      style: AppTypography.h2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Double check the draft copy before broadcasting it live to thousands of job seekers.',
                      style: AppTypography.body.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    PostJobReviewHeader(
                      title: '1. Job Details',
                      onEdit: () => context.push('/PostJobStep1'),
                    ),
                    SizedBox(height: 12.h),
                    const PostJobDetailsCard(
                      title: 'Senior Product Designer',
                      jobType: 'Full-Time',
                      workType: 'Hybrid',
                      experienceLevel: 'Mid-Senior Level',
                      location: 'Canada',
                    ),
                    SizedBox(height: 24.h),
                    PostJobReviewHeader(
                      title: '2. Job Description Preview',
                      onEdit: () => context.push('/PostJobStep2'),
                    ),
                    SizedBox(height: 12.h),
                    const PostJobDescriptionCard(
                      overview:
                          'A Senior UX Designer is a pivotal member of product development teams, responsible for ensuring that digital products and applications provide users with intuitive, efficient, and enjoyable interactions. They use a combination of research, thinking, and user empathy to inform their decisions, with the ultimate goal of delivering a seamless and satisfying user experience.',
                      skills: ['Figma', 'SaaS Product Design', 'User Research'],
                      bulletPoints: [
                        'Develop practical user flows and wireframes.',
                        'Create prototypes and conduct usability tests.',
                        'Adhere to design system guidelines.',
                        'Investigate optimal methods for generating thorough documentation.',
                        'Offer guidance and mentorship to junior team members.',
                        'Act as a consultant for Fellow UX Designers within closest 1 different groups or teams.',
                      ],
                    ),
                    SizedBox(height: 24.h),
                    PostJobReviewHeader(
                      title: '3. Compensation & Benefits',
                      onEdit: () => context.push('/PostJobStep3'),
                    ),
                    SizedBox(height: 12.h),
                    const PostJobCompensationCard(
                      salaryRange: '\$95,000 - \$125,000',
                      period: 'Years',
                      benefits: [
                        'Competitive compensation package',
                        'Convenient office location in the Copenhagen Area',
                        'Significant responsibilities and autonomy',
                        'Participation in a well funded startup poised for international growth',
                        'Collaborative work environment with experienced team',
                        'Joining a tight-knit passionate and friendly team',
                        'Prospects for increased responsibilities',
                      ],
                    ),
                    SizedBox(height: 24.h),
                    PostJobReviewHeader(
                      title: '4. Company Information',
                      onEdit: () => context.push('/PostJobStep4'),
                    ),
                    SizedBox(height: 12.h),
                    const PostJobCompanyCard(
                      companyName: 'Tech Company',
                      rating: 4.7,
                      companyInfo: '51-200 Employees • Technology & Software • https://techcorpsolutions.com',
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            const PostJobStep5BottomBar(),
          ],
        ),
      ),
    );
  }
}
