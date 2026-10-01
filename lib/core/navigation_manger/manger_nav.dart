import 'package:findwork_flutter/features/admin/presentation/pages/company_activation.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/user_management.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/candidate_profile.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_profile/employer_profile.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/home_page_employer/homepage_employer.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step1/post_job_step1_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step2/post_job_step2_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step3/post_job_step3_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/post_job_step4_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/post_job_step5_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_settings/employer_settings_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/company_profile_settings/company_profile_settings_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/applicants/applicants_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/application_details/application_details_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/Applicants',
  routes: [
    GoRoute(
      path: '/CandidateProfile',
      builder: (context, state) => const CandidateProfile(),
    ),
    GoRoute(
      path: '/EmployerProfile',
      builder: (context, state) => const EmployerProfile(),
    ),
    GoRoute(
      path: '/UserManagement',
      builder: (context, state) => const UserManagementScreen(),
    ),
    GoRoute(
      path: '/CompanyActivation',
      builder: (context, state) => const CompanyActivationScreen(),
    ),
    GoRoute(
      path: '/HomepageEmployer',
      builder: (context, state) => const HomepageEmployer(),
    ),
    GoRoute(
      path: '/PostJobStep1',
      builder: (context, state) => const PostJobStep1Screen(),
    ),
    GoRoute(
      path: '/PostJobStep2',
      builder: (context, state) => const PostJobStep2Screen(),
    ),
    GoRoute(
      path: '/PostJobStep3',
      builder: (context, state) => const PostJobStep3Screen(),
    ),
    GoRoute(
      path: '/PostJobStep4',
      builder: (context, state) => const PostJobStep4Screen(),
    ),
    GoRoute(
      path: '/PostJobStep5',
      builder: (context, state) => const PostJobStep5Screen(),
    ),
    GoRoute(
      path: '/EmployerSettings',
      builder: (context, state) => const EmployerSettingsScreen(),
    ),
    GoRoute(
      path: '/CompanyProfileSettings',
      builder: (context, state) => const CompanyProfileSettingsScreen(),
    ),
    GoRoute(
      path: '/Applicants',
      builder: (context, state) => const ApplicantsScreen(),
    ),
    GoRoute(
      path: '/ApplicationDetails',
      builder: (context, state) => const ApplicationDetailsScreen(),
    ),
  ],
);

