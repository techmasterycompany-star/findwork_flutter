import 'package:flutter/material.dart';

abstract class AppSpacing {
  // Icon and Text Spacing
  static const double iconTextGap = 8.0;

  // Page Title to Description Spacing
  static const double titleToDescription = 12.0;

  // Card Internal Padding
  static const double cardPadding = 24.0;
  static const double cardGapSmall = 20.0;
  static const double cardGapLarge = 32.0;

  // Header and Section Spacing
  static const double headerGap = 64.0;
  static const double sectionGap = 32.0;

  // Responsive Layout Spacing
  static const double sectionInternalPadding = 24.0;
  static const double menuToSectionsGap = 32.0;
  static const double footerToSectionsGap = 64.0;

  // ==================== SizedBox Helpers ====================
  static const SizedBox vertical8 = SizedBox(height: iconTextGap);
  static const SizedBox vertical12 = SizedBox(height: titleToDescription);
  static const SizedBox vertical20 = SizedBox(height: cardGapSmall);
  static const SizedBox vertical24 = SizedBox(height: sectionInternalPadding);
  static const SizedBox vertical32 = SizedBox(height: sectionGap);
  static const SizedBox vertical64 = SizedBox(height: headerGap);

  static const SizedBox horizontal8 = SizedBox(width: iconTextGap);
  static const SizedBox horizontal12 = SizedBox(width: titleToDescription);
  static const SizedBox horizontal24 = SizedBox(width: sectionInternalPadding);
}