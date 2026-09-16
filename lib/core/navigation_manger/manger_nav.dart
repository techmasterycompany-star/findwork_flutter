import 'package:findwork_flutter/core/utils/notification.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/company_activation.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/job_management.dart';
import 'package:findwork_flutter/features/admin/presentation/pages/user_management.dart';
import 'package:findwork_flutter/features/employer/presentation/pages/employer_profile/employer_profile.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: '/Notification',
  routes: [
    // ============ EMPLOYER ============
    GoRoute(
      path: '/EmployerProfile',
      builder: (context, state) => const EmployerProfile(),
    ),

    // ============ ADMIN ============
    GoRoute(
      path: '/UserManagement',
      builder: (context, state) => const UserManagementScreen(),
    ),

    GoRoute(
      path: '/CompanyActivation',
      builder: (context, state) => const CompanyActivationScreen(),
    ),

    GoRoute(
      path: '/JobManagement',
      builder: (context, state) => const JobManagementScreen(),
    ),

    // ============ OTHERS ============
        GoRoute(
      path: '/Notification',
      builder: (context, state) => const NotificationScreen(),
    ),
  ],
);
