import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_typography.dart';

abstract class AppTheme {
  // ==================== LIGHT THEME ====================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.neutral50,
      primaryColor: AppColors.primary600,
      
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary600,
        secondary: AppColors.primary500,
        surface: AppColors.white,
        error: AppColors.error500,
        onPrimary: AppColors.white,
        onSurface: AppColors.neutral900,
      ),

      textTheme: TextTheme(
        displayLarge: AppTypography.h1.copyWith(color: AppColors.neutral900),
        displayMedium: AppTypography.h2.copyWith(color: AppColors.neutral900),
        displaySmall: AppTypography.h3.copyWith(color: AppColors.neutral900),
        titleLarge: AppTypography.cardTitle.copyWith(color: AppColors.neutral900),
        bodyLarge: AppTypography.body.copyWith(color: AppColors.neutral800),
        bodyMedium: AppTypography.smallText.copyWith(color: AppColors.neutral700),
        bodySmall: AppTypography.caption.copyWith(color: AppColors.neutral500),
      ),

      cardTheme: const CardThemeData(
        color: AppColors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: AppColors.neutral200, width: 1),
        ),
      ),
    );
  }

  // ==================== DARK THEME ====================
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.neutral950,
      primaryColor: AppColors.primary500,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary500,
        secondary: AppColors.primary400,
        surface: AppColors.neutral900,
        error: AppColors.error400,
        onPrimary: AppColors.white,
        onSurface: AppColors.neutral50,
      ),

      textTheme: TextTheme(
        displayLarge: AppTypography.h1.copyWith(color: AppColors.neutral50),
        displayMedium: AppTypography.h2.copyWith(color: AppColors.neutral50),
        displaySmall: AppTypography.h3.copyWith(color: AppColors.neutral50),
        titleLarge: AppTypography.cardTitle.copyWith(color: AppColors.neutral50),
        bodyLarge: AppTypography.body.copyWith(color: AppColors.neutral200),
        bodyMedium: AppTypography.smallText.copyWith(color: AppColors.neutral300),
        bodySmall: AppTypography.caption.copyWith(color: AppColors.neutral400),
      ),

      cardTheme: const CardThemeData(
        color: AppColors.neutral900,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: AppColors.neutral800, width: 1),
        ),
      ),
    );
  }
}