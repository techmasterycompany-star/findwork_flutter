import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/notification.dart';
import '../../../../core/utils/widgets/pill_button.dart';
import 'package:findwork_flutter/features/admin/data/mock_data.dart';
import 'package:findwork_flutter/features/admin/presentation/widgets/summary_card.dart';
import 'pages/company_activation.dart';
import 'pages/job_management.dart';
import 'pages/user_management.dart';
import 'widgets/screen_headline.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  int _selectedIndex = 0;

  final _pages = const [
    _OverviewPage(),
    CompanyActivationScreen(),
    JobManagementScreen(),
    UserManagementScreen(),
    NotificationScreen(),
  ];

  final _drawerItems = const [
    _DrawerItem(icon: Icons.dashboard_outlined, label: 'Overview'),
    _DrawerItem(icon: Icons.business_outlined, label: 'Company Activation'),
    _DrawerItem(icon: Icons.work_outline, label: 'Job Management'),
    _DrawerItem(icon: Icons.people_outline, label: 'User Management'),
    _DrawerItem(icon: Icons.notifications_outlined, label: 'Notification'),
  ];

  void _onDrawerItemTap(int index) {
    setState(() => _selectedIndex = index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        title: const Text('JobIU'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              setState(() => _selectedIndex = 4);
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: AppSpacing.sectionInternalPadding),
            child: CircleAvatar(
              backgroundColor: AppColors.primary600,
              child: Icon(Icons.person, color: AppColors.white),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.iconTextGap,
              vertical: AppSpacing.sectionInternalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.sectionInternalPadding,
                  ),
                  child: HeadLine(message: 'Navigation'),
                ),
                const SizedBox(height: AppSpacing.iconTextGap),
                ...List.generate(_drawerItems.length, (index) {
                  final item = _drawerItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSpacing.iconTextGap,
                    ),
                    child: PillButton(
                      icon: item.icon,
                      label: item.label,
                      isSelected: _selectedIndex == index,
                      onTap: () => _onDrawerItemTap(index),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class _DrawerItem {
  final IconData icon;
  final String label;

  const _DrawerItem({required this.icon, required this.label});
}

class _OverviewPage extends StatelessWidget {
  const _OverviewPage();

  @override
  Widget build(BuildContext context) {
    final summaryCards = getOverviewSummary();

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
        padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadLine(message: 'Job Management'),
            AppSpacing.vertical24,
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.cardGapSmall,
              crossAxisSpacing: AppSpacing.cardGapSmall,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < summaryCards.length; i++)
                  SummaryCard(
                    title: summaryCards[i].title,
                    number: summaryCards[i].number,
                    subTitle: summaryCards[i].subTitle,
                    isFirst: i == 0,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
