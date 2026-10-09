import 'package:findwork_flutter/features/admin/presentation/pages/company_activation.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/user_management.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/about_us_mobile_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/analytics_candidates_mobile.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_five.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_fore.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_three.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_two.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidates_price_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidates_settings.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/contact_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/my_jobs_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/my_profile_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/notifications_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/saved_jobs_screen.dart';
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
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/admin_main.dart';

GoRouter router = GoRouter(
  initialLocation: '/CandidateHome',
  routes: [
    // ============ candidate ============
    GoRoute(
      path: '/CandidateHome',
      builder: (context, state) => const CandidateHome(),
    ),
    GoRoute(
      path: '/CandidateProfile',
      builder: (context, state) => const CandidateProfile(),
    ),
    GoRoute(
      path: '/AnalyticsCandidatesMobile',
      builder: (context, state) => const AnalyticsCandidatesMobile(),
    ),
    GoRoute(
      path: '/MyJobsScreen',
      builder: (context, state) => const MyJobsScreen(),
    ),
    GoRoute(
      path: '/NotificationsScreen',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/MyProfileScreen',
      builder: (context, state) => const MyProfileScreen(),
    ),
    GoRoute(
      path: '/CandidatesSettings',
      builder: (context, state) => const CandidatesSettings(),
    ),
    GoRoute(
      path: '/CandidateApplayFive',
      builder: (context, state) => const CandidateApplayFive(),
    ),
    GoRoute(
      path: '/CandidateApplayStepFore',
      builder: (context, state) => const CandidateApplayStepFore(),
    ),
    GoRoute(
      path: '/CandidateApplayStepTwo',
      builder: (context, state) => const CandidateApplayStepTwo(),
    ),
    GoRoute(
      path: '/CandidateApplayStepThree',
      builder: (context, state) => const CandidateApplayStepThree(),
    ),

    GoRoute(
      path: '/CandidateApplayScreen',
      builder: (context, state) => const CandidateApplayScreen(),
    ),
    GoRoute(
      path: '/SavedJobsScreen',
      builder: (context, state) => const SavedJobsScreen(),
    ),
    GoRoute(
      path: '/AboutUsMobileScreen',
      builder: (context, state) => const AboutUsMobileScreen(),
    ),
    GoRoute(
      path: '/CandidatesPriceScreen',
      builder: (context, state) => const CandidatesPriceScreen(),
    ),
    GoRoute(
      path: '/ContactScreen',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/EmployerProfile',
      builder: (context, state) => const EmployerProfile(),
    ),
    // ============ ADMIN ============
    GoRoute(path: '/AdminMain', builder: (context, state) => const AdminMain()),

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
