import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CandidatesSettings extends StatelessWidget {
  const CandidatesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings', style: Theme.of(context).textTheme.titleMedium),
              AppSpacing.vertical12,
              Text(
                'Manage your account, preferences and privacy',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              AppSpacing.vertical20,

              // Card Container الرئيسي
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 190,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              'asset/images/back-image.png',
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          ),

                          Positioned(
                            left: 16,
                            bottom: 0,
                            child: Stack(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.surface,
                                      width: 3,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image.asset(
                                      'asset/images/profile_image.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -2,
                                  bottom: -2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.surface,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.verified,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    AppSpacing.vertical12,

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sarah Johnson',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AppSpacing.vertical8,
                          Row(
                            children: [
                              Text(
                                'Software Engineer',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              AppSpacing.horizontal8,
                              Container(
                                width: 1,
                                height: 14,
                                color: AppColors.gray600,
                              ),
                              AppSpacing.horizontal8,
                              Icon(
                                Icons.place_outlined,
                                color: Theme.of(context).colorScheme.primary,
                                size: 16,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'San Francisco, California',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    AppSpacing.vertical20,
                    const Divider(height: 1, color: Color(0xFFEEEEEE)),

                    // 3. عناصر القائمة
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'My Profile',
                      titleColor: Theme.of(context).colorScheme.primary,
                      iconColor: Theme.of(context).colorScheme.primary,
                      onTap: () {
                        context.push('/MyProfileScreen');
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_none_outlined,
                      title: 'Notifications',
                      onTap: () {
                        context.push('/NotificationsScreen');
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.article_outlined,
                      title: 'Resume & Documents',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.nights_stay_outlined,
                      title: 'Language & Appearance',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.visibility_outlined,
                      title: 'Privacy & Visibility',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.chat_bubble_outline,
                      title: 'Messages',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.work_outline,
                      title: 'Job Preferences',
                      onTap: () {
                        context.push('/MyJobsScreen');
                      },
                    ),
                    _buildMenuItem(
                      icon: Icons.bar_chart_outlined,
                      title: 'Analytics',
                      onTap: () {
                        context.push('/AnalyticsCandidatesMobile');
                      },
                    ),
                    AppSpacing.vertical8,
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Log Out',
                      titleColor: Colors.redAccent,
                      iconColor: Colors.redAccent,
                      onTap: () {},
                    ),
                    AppSpacing.vertical12,
                  ],
                ),
              ),
              AppSpacing.vertical20,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? titleColor,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? Colors.grey[600]),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: titleColor ?? Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
