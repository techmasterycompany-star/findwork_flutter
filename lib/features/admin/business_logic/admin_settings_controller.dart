import 'package:flutter/material.dart';

class AdminSettingsController extends ChangeNotifier {
  AdminSettingsController._();

  static final AdminSettingsController instance = AdminSettingsController._();

  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  bool get isArabic => _locale.languageCode == 'ar';

  void setThemeMode(ThemeMode value) {
    if (_themeMode == value) return;
    _themeMode = value;
    notifyListeners();
  }

  void setLocale(Locale value) {
    if (_locale.languageCode == value.languageCode) return;
    _locale = value;
    notifyListeners();
  }
}
