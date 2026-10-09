import 'package:findwork_flutter/features/admin/presentation/pages/company_activation.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/user_management.dart';

// Imports from Auth Feature (HEAD)
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/candidate_account_info_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/candidate_profile_info_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/candidate_review_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/congratulation_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/employer_company_info_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/employer_hiring_preferences_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/employer_review_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/login_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:findwork_flutter/features/auth/presentation/pages/user_type_selection_screen.dart';

// Imports from Candidates Feature (candidates)
import 'package:findwork_flutter/features/candidates/presentation/pages/about_us_mobile_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/analytics_candidates_mobile.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_five.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_fore.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_three.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_applay_step_two.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidate_home.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidates_price_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidates_settings.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/contact_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/my_jobs_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/my_profile_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/notifications_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/saved_jobs_screen.dart';

// Imports from Employer & Admin Features
import 'package:findwork_flutter/features/employer/presentation/pages/applicants/applicants_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/application_details/application_details_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/candidate_profile/candidate_profile.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/company_profile_settings/company_profile_settings_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_profile/employer_profile.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_settings/employer_settings_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/home_page_employer/homepage_employer.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/notifications/employer_notifications_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step1/post_job_step1_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step2/post_job_step2_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step3/post_job_step3_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step4/post_job_step4_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step5/post_job_step5_screen.dart';

import 'package:go_router/go_router.dart';
import 'dart:developer' as dev;

import '../../features/admin/presentation/admin_main.dart';

GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    // ============ AUTH ============
    GoRoute(
      path: '/login',
      builder: (context, state) {
        final extra = state.extra;
        String userTypeString = 'candidate';
        if (extra is String) {
          userTypeString = extra;
        } else if (extra is UserType) {
          userTypeString = extra.name;
        }
        dev.log('Route /login, extra: $userTypeString');
        final userType = UserType.values.firstWhere(
          (e) => e.name == userTypeString,
          orElse: () => UserType.candidate,
        );
        return LoginScreen(initialUserType: userType);
      },
    ),
    GoRoute(
      path: '/register/user-type',
      builder: (context, state) => const UserTypeSelectionScreen(),
    ),
    // Candidate Registration Flow
    GoRoute(
      path: '/register/candidate/account-info',
      builder: (context, state) => const CandidateAccountInfoScreen(),
    ),
    GoRoute(
      path: '/register/candidate/profile-info',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return CandidateProfileInfoScreen(accountData: extra ?? {});
      },
    ),
    GoRoute(
      path: '/register/candidate/review',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return CandidateReviewScreen(data: extra ?? {});
      },
    ),
    // Employer Registration Flow
    GoRoute(
      path: '/register/employer/company-info',
      builder: (context, state) => const EmployerCompanyInfoScreen(),
    ),
    GoRoute(
      path: '/register/employer/hiring-preferences',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return EmployerHiringPreferencesScreen(companyData: extra ?? {});
      },
    ),
    GoRoute(
      path: '/register/employer/review',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return EmployerReviewScreen(data: extra ?? {});
      },
    ),
    GoRoute(
      path: '/congratulation',
      builder: (context, state) => const CongratulationScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) {
        final extra = state.extra;
        String userTypeString = 'candidate';
        if (extra is String) {
          userTypeString = extra;
        } else if (extra is UserType) {
          userTypeString = extra.name;
        }
        final userType = UserType.values.firstWhere(
          (e) => e.name == userTypeString,
          orElse: () => UserType.candidate,
        );
        return ForgotPasswordScreen(initialUserType: userType);
      },
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) {
        final extra = state.extra;
        String email = '';
        UserType userType = UserType.candidate;
        if (extra is Map<String, dynamic>) {
          email = extra['email'] as String? ?? '';
          final userTypeExtra = extra['userType'];
          if (userTypeExtra is UserType) {
            userType = userTypeExtra;
          } else if (userTypeExtra is String) {
            userType = UserType.values.firstWhere(
              (e) => e.name == userTypeExtra,
              orElse: () => UserType.candidate,
            );
          }
        }
        return ResetPasswordScreen(email: email, userType: userType);
      },
    ),

    // ============ CANDIDATE ============
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

    // ============ EMPLOYER ============
    GoRoute(
      path: '/EmployerProfile',
      builder: (context, state) => const EmployerProfile(),
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
    GoRoute(
      path: '/EmployerNotifications',
      builder: (context, state) => const EmployerNotificationsScreen(),
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
  ],
);
