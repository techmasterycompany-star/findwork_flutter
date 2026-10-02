import 'package:findwork_flutter/core/navigation_manger/manger_nav.dart';
import 'package:findwork_flutter/features/candidates/business_logic/cubit/language_cubit.dart';
import 'package:findwork_flutter/features/candidates/business_logic/cubit/theme/theme_cubit.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LanguageCubit, String>(
          builder: (context, language) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              child: MaterialApp.router(
                title: 'Job4U',
                debugShowCheckedModeBanner: false,

                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeMode,

                locale: Locale(language),
                supportedLocales: S.delegate.supportedLocales,

                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                routerConfig: router,
              ),
            );
          },
        );
      },
    );
  }
}
