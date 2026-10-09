import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'widgets/employer_info_card.dart';
import 'widgets/settings_menu_item.dart';

class EmployerSettingsScreen extends StatelessWidget {
  const EmployerSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Manage your company and account settings.',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color(0xFF52525B),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7C3AED).withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const EmployerInfoCard(),
                        SizedBox(height: 16.h),
                        SettingsMenuItem(
                          icon: Icons.business,
                          title: 'Company profile',
                          titleColor: const Color(0xFF7C3AED),
                          iconColor: const Color(0xFF7C3AED),
                          isBold: true,
                          onTap: () {
                            context.push('/CompanyProfileSettings');
                          },
                        ),
                        SettingsMenuItem(
                          icon: Icons.notifications_none,
                          title: 'Notifications',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.message_outlined,
                          title: 'Messages',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.people_outline,
                          title: 'Team & Permissions',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.credit_card,
                          title: 'Billing & Subscription',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.language,
                          title: 'Language & Appearance',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.visibility_off_outlined,
                          title: 'Privacy & Visibility',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.security,
                          title: 'Security',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.person_outline,
                          title: 'Account Management',
                          onTap: () {},
                        ),
                        SettingsMenuItem(
                          icon: Icons.logout,
                          title: 'Log Out',
                          titleColor: Colors.red,
                          iconColor: Colors.red,
                          onTap: () {},
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
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
