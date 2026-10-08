import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:flutter/material.dart';

class AuthConstants {
  static const List<UserTypeOption> userTypeOptions = [
    UserTypeOption(
      type: UserType.candidate,
      title: 'I\'m a Candidate',
      subtitle: 'Looking for job opportunities',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      color: AppColors.primary600,
      bgColor: AppColors.primary50,
    ),
    UserTypeOption(
      type: UserType.employer,
      title: 'I\'m an Employer',
      subtitle: 'Hiring talent for my company',
      icon: Icons.business_outlined,
      selectedIcon: Icons.business,
      color: AppColors.success600,
      bgColor: AppColors.success50,
    ),
  ];
}

class UserTypeOption {
  final UserType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData selectedIcon;
  final Color color;
  final Color bgColor;

  const UserTypeOption({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selectedIcon,
    required this.color,
    required this.bgColor,
  });

  Color get colorValue => color;
  Color get bgColorValue => bgColor;
}