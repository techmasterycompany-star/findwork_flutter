import 'package:findwork_flutter/features/employer/presentation/pages/employer_profile/employer_profile.dart';
import 'package:go_router/go_router.dart';
GoRouter router = GoRouter(
  initialLocation: '/EmployerProfile',
  routes: [
    GoRoute(
      path: '/EmployerProfile',
      builder: (context, state) => const EmployerProfile(),
    )
  ]);