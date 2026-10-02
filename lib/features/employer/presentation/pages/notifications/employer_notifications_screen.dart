import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/notification_card.dart';
import 'widgets/notification_tab_bar.dart';
import 'widgets/system_notification_card.dart';

class EmployerNotificationsScreen extends StatefulWidget {
  const EmployerNotificationsScreen({super.key});

  @override
  State<EmployerNotificationsScreen> createState() =>
      _EmployerNotificationsScreenState();
}

class _EmployerNotificationsScreenState
    extends State<EmployerNotificationsScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Notification',
                        style: AppTypography.cardTitle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColors.neutral900,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // mark all as read
                        },
                        child: Text(
                          'More all as read',
                          style: AppTypography.smallText.copyWith(
                            color: AppColors.primary600,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // ── Tab Bar ──────────────────────────────────────────────
                  NotificationTabBar(
                    selectedIndex: _selectedTab,
                    allCount: 3,
                    candidatesCount: 2,
                    onTabSelected: (index) =>
                        setState(() => _selectedTab = index),
                  ),
                  SizedBox(height: 20.h),

                  // ── Notifications List ────────────────────────────────────
                  if (_selectedTab == 0) ..._buildAllNotifications()
                  else ..._buildCandidateNotifications(),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllNotifications() {
    return [
      NotificationCard(
        avatarInitials: 'JA',
        avatarColor: AppColors.primary600,
        message:
            'James Ahmed Applied for Senior UI/UX Designer',
        timeAgo: 'Just Now',
        isNew: true,
        onViewApplication: () {},
      ),
      NotificationCard(
        avatarInitials: 'EM',
        avatarColor: const Color(0xFF10B981),
        message:
            'Emin Ali Applied for Senior UI/UX Designer\nFull Time',
        timeAgo: '1min',
        isNew: false,
        onViewApplication: () {},
      ),
      SystemNotificationCard(
        title: 'System Admin · Account Status Update',
        message:
            'Your company account has been successfully approved and is now visible to candidates.',
        actionLabel: 'Post a Job',
        onAction: () {},
        isNew: false,
      ),
    ];
  }

  List<Widget> _buildCandidateNotifications() {
    return [
      NotificationCard(
        avatarInitials: 'JA',
        avatarColor: AppColors.primary600,
        message:
            'James Ahmed Applied for Senior UI/UX Designer',
        timeAgo: 'Just Now',
        isNew: true,
        onViewApplication: () {},
      ),
      NotificationCard(
        avatarInitials: 'EM',
        avatarColor: const Color(0xFF10B981),
        message:
            'Emin Ali Applied for Senior UI/UX Designer\nFull Time',
        timeAgo: '1min',
        isNew: false,
        onViewApplication: () {},
      ),
    ];
  }
}
