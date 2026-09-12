export 'models/company_activation.dart';
export 'models/summary_card_data.dart';
export 'models/user_management_data.dart';

import 'models/company_activation.dart';
import 'models/summary_card_data.dart';
import 'models/user_management_data.dart';

final List<CompanyActivation> mockCompanyActivations = [
  CompanyActivation(
    name: 'Tech Solutions',
    category: 'Software/Technology',
    date: '25/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'Digital World',
    category: 'Software/Technology',
    date: '24/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'Green Energy Co',
    category: 'Renewable Energy',
    date: '23/08/2026',
    status: 'Active',
  ),
  CompanyActivation(
    name: 'Health Plus',
    category: 'Healthcare',
    date: '22/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'EduLearn',
    category: 'Education',
    date: '21/08/2026',
    status: 'Rejected',
  ),
  CompanyActivation(
    name: 'Foodie Hub',
    category: 'Food & Beverage',
    date: '20/08/2026',
    status: 'Active',
  ),
  CompanyActivation(
    name: 'Finance Pro',
    category: 'Finance',
    date: '19/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'TravelMate',
    category: 'Travel & Tourism',
    date: '18/08/2026',
    status: 'Active',
  ),
  CompanyActivation(
    name: 'Style Studio',
    category: 'Fashion',
    date: '17/08/2026',
    status: 'Rejected',
  ),
  CompanyActivation(
    name: 'BuildIt',
    category: 'Construction',
    date: '16/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'CloudNine',
    category: 'Software/Technology',
    date: '15/08/2026',
    status: 'Active',
  ),
  CompanyActivation(
    name: 'MediaWorks',
    category: 'Media & Entertainment',
    date: '14/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'AutoDrive',
    category: 'Automotive',
    date: '13/08/2026',
    status: 'Active',
  ),
  CompanyActivation(
    name: 'PetCare',
    category: 'Animal Care',
    date: '12/08/2026',
    status: 'Pending',
  ),
  CompanyActivation(
    name: 'LogiSwift',
    category: 'Logistics',
    date: '11/08/2026',
    status: 'Rejected',
  ),
];

final List<UserManagementData> mockUsers = [
  UserManagementData(
    name: 'Tech Solutions',
    role: 'Software/Technology',
    date: '25/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Aya Ahmed',
    role: 'UI/UX Designer',
    date: '25/08/2026',
    status: 'InActive',
    isCompany: false,
  ),
  UserManagementData(
    name: 'Digital World',
    role: 'Software/Technology',
    date: '24/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Mohamed Ali',
    role: 'Backend Developer',
    date: '24/08/2026',
    status: 'Active',
    isCompany: false,
  ),
  UserManagementData(
    name: 'Health Plus',
    role: 'Healthcare',
    date: '23/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Sara Hassan',
    role: 'Product Manager',
    date: '23/08/2026',
    status: 'InActive',
    isCompany: false,
  ),
  UserManagementData(
    name: 'EduLearn',
    role: 'Education',
    date: '22/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Omar Khalid',
    role: 'Data Analyst',
    date: '22/08/2026',
    status: 'Active',
    isCompany: false,
  ),
  UserManagementData(
    name: 'Finance Pro',
    role: 'Finance',
    date: '21/08/2026',
    status: 'InActive',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Nada Youssef',
    role: 'Marketing Specialist',
    date: '21/08/2026',
    status: 'Active',
    isCompany: false,
  ),
  UserManagementData(
    name: 'TravelMate',
    role: 'Travel & Tourism',
    date: '20/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Ahmed Mansour',
    role: 'DevOps Engineer',
    date: '20/08/2026',
    status: 'InActive',
    isCompany: false,
  ),
  UserManagementData(
    name: 'Style Studio',
    role: 'Fashion',
    date: '19/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Fatma Ibrahim',
    role: 'Content Writer',
    date: '19/08/2026',
    status: 'Active',
    isCompany: false,
  ),
  UserManagementData(
    name: 'BuildIt',
    role: 'Construction',
    date: '18/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Youssef Karim',
    role: 'Mobile Developer',
    date: '18/08/2026',
    status: 'InActive',
    isCompany: false,
  ),
  UserManagementData(
    name: 'CloudNine',
    role: 'Software/Technology',
    date: '17/08/2026',
    status: 'Active',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Layla Abbas',
    role: 'QA Engineer',
    date: '17/08/2026',
    status: 'Active',
    isCompany: false,
  ),
  UserManagementData(
    name: 'MediaWorks',
    role: 'Media & Entertainment',
    date: '16/08/2026',
    status: 'InActive',
    isCompany: true,
  ),
  UserManagementData(
    name: 'Hassan Farouk',
    role: 'Graphic Designer',
    date: '16/08/2026',
    status: 'Active',
    isCompany: false,
  ),
];

List<SummaryCardData> getCompanyActivationSummary() {
  final pending = mockCompanyActivations.where((c) => c.status == 'Pending').length;
  final active = mockCompanyActivations.where((c) => c.status == 'Active').length;
  final rejected = mockCompanyActivations.where((c) => c.status == 'Rejected').length;
  final total = mockCompanyActivations.length;

  return [
    SummaryCardData(title: 'Pending Activation', number: '$pending', subTitle: 'Requires your review'),
    SummaryCardData(title: 'Active Companies', number: '$active', subTitle: 'Activated companies'),
    SummaryCardData(title: 'Rejected', number: '$rejected', subTitle: 'Rejected companies'),
    SummaryCardData(title: 'Total companies', number: '$total', subTitle: 'All companies'),
  ];
}

List<SummaryCardData> getUserManagementSummary() {
  final total = mockUsers.length;
  final active = mockUsers.where((u) => u.status == 'Active').length;
  final candidates = mockUsers.where((u) => !u.isCompany).length;
  final employers = mockUsers.where((u) => u.isCompany).length;

  return [
    SummaryCardData(title: 'Total Users', number: '$total', subTitle: '+12% From last week'),
    SummaryCardData(title: 'Active Users', number: '$active', subTitle: '+8.1% From last week'),
    SummaryCardData(title: 'Candidates', number: '$candidates', subTitle: '+85.5% From last week'),
    SummaryCardData(title: 'Employers', number: '$employers', subTitle: '+8.1% From last week'),
  ];
}
