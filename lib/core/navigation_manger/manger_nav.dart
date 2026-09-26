import 'package:findwork_flutter/features/admin/presentation/pages/company_activation.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/user_management.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_profile/employer_profile.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/home_page_employer/homepage_employer.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step1/post_job_step1_screen.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/post_job/step2/post_job_step2_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/PostJobStep2',
  routes: [
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
  ],
);

