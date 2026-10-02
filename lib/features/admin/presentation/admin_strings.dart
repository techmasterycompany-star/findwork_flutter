import 'package:flutter/widgets.dart';

import '../business_logic/admin_settings_controller.dart';

class AdminStrings {
  const AdminStrings._(this.isArabic);

  final bool isArabic;

  static AdminStrings of(BuildContext context) {
    return AdminStrings._(AdminSettingsController.instance.isArabic);
  }

  String get navigation => isArabic ? 'التنقل' : 'Navigation';
  String get overview => isArabic ? 'نظرة عامة' : 'Overview';
  String get companyActivation =>
      isArabic ? 'تفعيل الشركات' : 'Company Activation';
  String get jobManagement => isArabic ? 'إدارة الوظائف' : 'Job Management';
  String get userManagement =>
      isArabic ? 'إدارة المستخدمين' : 'User Management';
  String get notification => isArabic ? 'الإشعارات' : 'Notification';
  String get noNotifications => isArabic
      ? 'لا توجد إشعارات الآن. تحقق لاحقا!'
      : 'Nothing right now. Check back later!';
  String get settings => isArabic ? 'الإعدادات' : 'Settings';
  String get all => isArabic ? 'الكل' : 'All';
  String get pending => isArabic ? 'معلق' : 'Pending';
  String get rejected => isArabic ? 'مرفوض' : 'Rejected';
  String get approved => isArabic ? 'تمت الموافقة' : 'Approved';
  String get review => isArabic ? 'مراجعة' : 'Review';
  String get noCompaniesFound =>
      isArabic ? 'لا توجد شركات' : 'No companies found';
  String get noJobsFound => isArabic ? 'لا توجد وظائف' : 'No jobs found';
  String get noUsersFound => isArabic ? 'لا يوجد مستخدمون' : 'No users found';
  String get searchByCompany =>
      isArabic ? 'ابحث باسم الشركة...' : 'Search by company name...';
  String get searchByNameOrCompany =>
      isArabic ? 'ابحث بالاسم أو الشركة' : 'Search by name company';
  String get themeMode => isArabic ? 'وضع المظهر' : 'Theme mode';
  String get system => isArabic ? 'حسب النظام' : 'System';
  String get light => isArabic ? 'فاتح' : 'Light';
  String get dark => isArabic ? 'داكن' : 'Dark';
  String get language => isArabic ? 'اللغة' : 'Language';
  String get english => isArabic ? 'الإنجليزية' : 'English';
  String get arabic => isArabic ? 'العربية' : 'Arabic';
  String get appPreferences =>
      isArabic ? 'تفضيلات لوحة التحكم' : 'Admin preferences';
}
