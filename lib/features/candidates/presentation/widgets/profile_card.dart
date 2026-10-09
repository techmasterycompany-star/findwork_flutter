import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String location;
  final String website;
  final String imagePath;
  final String backImagePath;
  final bool isVerified;

  const ProfileCard({
    super.key,
    required this.name,
    required this.description,
    required this.location,
    required this.website,
    required this.imagePath,
    required this.backImagePath,
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.surface,
      elevation: 2,
      shadowColor: theme.shadowColor.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 132,
                width: double.infinity,
                child: Image.asset(backImagePath, fit: BoxFit.cover),
              ),

              Positioned(
                left: AppSpacing.cardPadding,
                bottom: -35,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.asset(
                          imagePath,
                          width: 82,
                          height: 82,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    if (isVerified)
                      Positioned(
                        right: -4,
                        bottom: -3,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: theme.colorScheme.primary,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 42),

          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.cardPadding,
              0,
              AppSpacing.cardPadding,
              AppSpacing.cardPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                AppSpacing.vertical8,

                Text(description, style: theme.textTheme.bodyMedium),

                AppSpacing.vertical12,

                Wrap(
                  spacing: AppSpacing.cardGapSmall,
                  runSpacing: AppSpacing.iconTextGap,
                  children: [
                    _InfoItem(icon: Icons.location_on_outlined, text: location),
                    _InfoItem(icon: Icons.language_outlined, text: website),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.primary),
        AppSpacing.horizontal8,
        Text(text, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
