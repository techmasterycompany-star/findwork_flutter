import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class AboutTeam extends StatelessWidget {
  const AboutTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final members = [
      (
        'Layla Hassan',
        'CEO & Co-Founder',
        'Former product lead at LinkedIn. Passionate about democratizing work.',
        'asset/images/user1.png',
      ),
      (
        'Omar Khalil',
        'CTO & Co-Founder',
        'Ex-Google engineer. Built scalable platforms used by millions.',
        'asset/images/user2.png',
      ),
      (
        'Ahmed Nasser',
        'Head of Operations',
        'Operations strategist. Streamlines processes that serve 2M+ users.',
        'asset/images/user3.png',
      ),
      (
        'Sara Mostafa',
        'Head of Design',
        'Award-winning UX designer. Believes great design enables opportunity.',
        'asset/images/user4.png',
      ),
    ];

    return Column(
      children: [
        Text(
          'The People Behind Job4U',
          style: TextStyle(
            color: AppColors.primary600,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppSpacing.vertical12,
        Text(
          'Meet Our Team',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        AppSpacing.vertical20,

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: members.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 20,
            childAspectRatio: .8,
          ),
          itemBuilder: (context, index) {
            final member = members[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      member.$4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                AppSpacing.vertical8,

                Text(
                  member.$1,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppSpacing.vertical8,
                Text(
                  member.$2,
                  style: TextStyle(
                    color: AppColors.primary500,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.vertical8,
                Text(member.$3, style: theme.textTheme.bodySmall),
              ],
            );
          },
        ),
      ],
    );
  }
}
