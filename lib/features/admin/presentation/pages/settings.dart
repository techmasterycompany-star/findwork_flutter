import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../business_logic/admin_settings_controller.dart';
import '../admin_strings.dart';
import '../widgets/screen_headline.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AdminSettingsController.instance,
      builder: (context, _) {
        final controller = AdminSettingsController.instance;
        final strings = AdminStrings.of(context);

        return Directionality(
          textDirection: controller.isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: AppSpacing.sectionGap,
              ),
              padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadLine(message: strings.settings),
                  AppSpacing.vertical24,
                  Text(
                    strings.appPreferences,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  AppSpacing.vertical24,
                  _SettingsSection(
                    title: strings.themeMode,
                    child: RadioGroup<ThemeMode>(
                      groupValue: controller.themeMode,
                      onChanged: (value) {
                        if (value != null) controller.setThemeMode(value);
                      },
                      child: Column(
                        children: [
                          RadioListTile<ThemeMode>(
                            value: ThemeMode.system,
                            title: Text(strings.system),
                          ),
                          RadioListTile<ThemeMode>(
                            value: ThemeMode.light,
                            title: Text(strings.light),
                          ),
                          RadioListTile<ThemeMode>(
                            value: ThemeMode.dark,
                            title: Text(strings.dark),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSpacing.vertical24,
                  _SettingsSection(
                    title: strings.language,
                    child: RadioGroup<Locale>(
                      groupValue: controller.locale,
                      onChanged: (value) {
                        if (value != null) controller.setLocale(value);
                      },
                      child: Column(
                        children: [
                          RadioListTile<Locale>(
                            value: const Locale('en'),
                            title: Text(strings.english),
                          ),
                          RadioListTile<Locale>(
                            value: const Locale('ar'),
                            title: Text(strings.arabic),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _SettingsSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorTheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        border: Border.all(color: colorTheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.iconTextGap,
          vertical: AppSpacing.titleToDescription,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sectionInternalPadding,
              ),
              child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
