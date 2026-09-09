import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

abstract class AppTypography {
  // H1: 40px Bold
  static TextStyle h1 = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.neutral900,
  );

  // H2: 32px SemiBold
  static TextStyle h2 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral900,
  );

  // H3: 24px SemiBold
  static TextStyle h3 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral900,
  );

  // Card Title: 18px SemiBold
  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral900,
  );

  // Body: 16px Regular
  static TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.neutral800,
  );

  // Small Text: 14px Regular
  static TextStyle smallText = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.neutral700,
  );

  // Caption: 12px Regular
  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.neutral500,
  );
}