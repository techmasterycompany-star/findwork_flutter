export 'models/company_activation.dart';
export 'models/job.dart';
export 'models/summary_card_data.dart';
export 'models/user_management_data.dart';

import '../business_logic/admin_settings_controller.dart';
import 'arabic_mock_data.dart' as ar;
import 'english_mock_data.dart' as en;
import 'models/company_activation.dart';
import 'models/job.dart';
import 'models/summary_card_data.dart';
import 'models/user_management_data.dart';

bool get _isArabic => AdminSettingsController.instance.isArabic;

List<CompanyActivation> get mockCompanyActivations =>
    _isArabic ? ar.mockCompanyActivations : en.mockCompanyActivations;

List<UserManagementData> get mockUsers =>
    _isArabic ? ar.mockUsers : en.mockUsers;

List<Job> get mockJobs => _isArabic ? ar.mockJobs : en.mockJobs;

List<SummaryCardData> getCompanyActivationSummary() => _isArabic
    ? ar.getCompanyActivationSummary()
    : en.getCompanyActivationSummary();

List<SummaryCardData> getUserManagementSummary() =>
    _isArabic ? ar.getUserManagementSummary() : en.getUserManagementSummary();

List<SummaryCardData> getJobManagementSummary() =>
    _isArabic ? ar.getJobManagementSummary() : en.getJobManagementSummary();

List<SummaryCardData> getOverviewSummary() =>
    _isArabic ? ar.getOverviewSummary() : en.getOverviewSummary();
