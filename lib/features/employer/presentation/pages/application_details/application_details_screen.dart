import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/applicant_about_section.dart';
import 'widgets/applicant_documents_section.dart';
import 'widgets/applicant_experience_section.dart';
import 'widgets/applicant_profile_header.dart';
import 'widgets/applicant_quick_actions.dart';
import 'widgets/applicant_skills_section.dart';
import 'widgets/applicant_status_dropdown.dart';
import 'widgets/application_breadcrumbs.dart';

class ApplicationDetailsScreen extends StatefulWidget {
  const ApplicationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ApplicationDetailsScreen> createState() => _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {
  String _status = 'Under Review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: const ApplicationBreadcrumbs(
                      paths: ['All Jobs', 'UI UX Designer', 'Applications', 'Sarah Mitchell'],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  
                  // Profile Header
                  const ApplicantProfileHeader(
                    name: 'Sarah Mitchell',
                    role: 'Senior UI/UX Designer',
                    location: 'San Francisco, CA',
                    email: 'sarah.mitchell@design.com',
                    matchScore: '87% Excellent Match',
                  ),
                  SizedBox(height: 16.h),

                  // Status Dropdown
                  ApplicantStatusDropdown(
                    status: _status,
                    onChanged: (val) {
                      if (val != null) setState(() => _status = val);
                    },
                  ),
                  SizedBox(height: 16.h),

                  // Quick Actions
                  ApplicantQuickActions(
                    onSchedule: () {},
                    onShortlist: () {},
                    onMessage: () {},
                    onReject: () {},
                  ),
                  SizedBox(height: 16.h),

                  // Cover Letter
                  const ApplicantAboutSection(
                    aboutText: 'Dear Hiring Team, I am thrilled to apply for the Senior UI/UX Designer position at Tech Company. With over 5 years of experience building thoughtful product ecosystems and scaling design systems, I am confident I can lead product design efforts with clarity and care.',
                  ),
                  SizedBox(height: 16.h),

                  // Work Experience
                  const ApplicantExperienceSection(
                    experiences: [
                      {
                        'title': 'Lead Product Designer',
                        'company': 'FinTech Solutions Corp',
                        'duration': '2024 - Present',
                        'description': 'Led end-to-end product design, scaling design systems and mobile experiences across platforms.',
                      },
                      {
                        'title': 'Senior UI/UX Designer',
                        'company': 'SaaS Corp International',
                        'duration': '2021 - 2024',
                        'description': 'Designed complex dashboards for enterprise B2B clients, reducing task completion times by 30%.',
                      },
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Skills & Expertise
                  const ApplicantSkillsSection(
                    skills: [
                      'Figma',
                      'Design Systems',
                      'Prototyping',
                      'User Research',
                      'Wireframing',
                      'Interaction Design',
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Documents
                  const ApplicantDocumentsSection(
                    documents: ['Sarah_Mitchell_CV.pdf'],
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
