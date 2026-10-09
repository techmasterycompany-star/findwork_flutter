import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/applicant_card.dart';
import 'widgets/applicants_filter_bar.dart';
import 'widgets/applicants_search_bar.dart';
import 'widgets/applicants_stats_row.dart';

class ApplicantsScreen extends StatefulWidget {
  const ApplicantsScreen({Key? key}) : super(key: key);

  @override
  State<ApplicantsScreen> createState() => ApplicantsScreenState();
}

class ApplicantsScreenState extends State<ApplicantsScreen> {
  int _selectedFilterIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static const List<String> _filterTabs = [
    'All',
    'New',
    'Shortlisted',
    'Interview',
    'Hired',
    'Rejected',
  ];

  static const List<Map<String, dynamic>> _allApplicants = [
    {
      'name': 'Sarah Johnson',
      'jobTitle': 'Senior UI/UX Designer',
      'location': 'New York, USA',
      'experience': '5 years exp.',
      'matchScore': 92.0,
      'status': 'New',
      'skills': ['Figma', 'User Research', 'Prototyping'],
      'appliedDate': '2 days ago',
    },
    {
      'name': 'Michael Chen',
      'jobTitle': 'Product Designer',
      'location': 'San Francisco, USA',
      'experience': '3 years exp.',
      'matchScore': 85.0,
      'status': 'Shortlisted',
      'skills': ['Adobe XD', 'Sketch', 'React UX'],
      'appliedDate': '3 days ago',
    },
    {
      'name': 'Aisha Patel',
      'jobTitle': 'UX Researcher',
      'location': 'London, UK',
      'experience': '4 years exp.',
      'matchScore': 78.0,
      'status': 'Interview',
      'skills': ['User Testing', 'Analytics', 'Wireframing'],
      'appliedDate': '1 week ago',
    },
    {
      'name': 'Carlos Rivera',
      'jobTitle': 'Visual Designer',
      'location': 'Austin, Texas',
      'experience': '2 years exp.',
      'matchScore': 70.0,
      'status': 'New',
      'skills': ['Illustrator', 'Photoshop', 'Branding'],
      'appliedDate': '5 days ago',
    },
    {
      'name': 'Emily Wong',
      'jobTitle': 'Interaction Designer',
      'location': 'Toronto, Canada',
      'experience': '6 years exp.',
      'matchScore': 88.0,
      'status': 'Hired',
      'skills': ['Motion Design', 'Figma', 'CSS'],
      'appliedDate': '2 weeks ago',
    },
    {
      'name': 'David Okafor',
      'jobTitle': 'UI Developer',
      'location': 'Lagos, Nigeria',
      'experience': '1 year exp.',
      'matchScore': 55.0,
      'status': 'Rejected',
      'skills': ['HTML', 'CSS', 'Flutter'],
      'appliedDate': '1 month ago',
    },
  ];

  List<Map<String, dynamic>> get _filteredApplicants {
    final selectedTab = _filterTabs[_selectedFilterIndex];
    return _allApplicants.where((a) {
      final matchesFilter = selectedTab == 'All' || a['status'] == selectedTab;
      final matchesSearch = _searchQuery.isEmpty ||
          (a['name'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (a['jobTitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredApplicants;

    return Scaffold(
      backgroundColor: AppColors.neutral50,
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back navigation
                  InkWell(
                    onTap: () => context.pop(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios_new, size: 14.sp, color: AppColors.neutral700),
                        SizedBox(width: 6.w),
                        Text(
                          'Back',
                          style: AppTypography.smallText.copyWith(color: AppColors.neutral700),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Title + subtitle
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Applicants',
                              style: AppTypography.h2.copyWith(
                                color: AppColors.neutral900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Senior Product Designer · Job4U',
                              style: AppTypography.smallText.copyWith(
                                color: AppColors.neutral500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Export button
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.neutral200),
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.download_rounded, size: 16.sp, color: AppColors.neutral700),
                            SizedBox(width: 6.w),
                            Text(
                              'Export',
                              style: AppTypography.smallText.copyWith(
                                color: AppColors.neutral700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Stats
                  ApplicantsStatsRow(
                    total: _allApplicants.length,
                    newCount: _allApplicants.where((a) => a['status'] == 'New').length,
                    shortlisted: _allApplicants.where((a) => a['status'] == 'Shortlisted').length,
                    interviews: _allApplicants.where((a) => a['status'] == 'Interview').length,
                  ),
                  SizedBox(height: 20.h),
                  // Search bar
                  ApplicantsSearchBar(
                    controller: _searchController,
                    onChanged: (val) => setState(() => _searchQuery = val),
                  ),
                  SizedBox(height: 16.h),
                  // Filter tabs
                  ApplicantsFilterBar(
                    tabs: _filterTabs,
                    selectedIndex: _selectedFilterIndex,
                    onTabSelected: (i) => setState(() => _selectedFilterIndex = i),
                  ),
                  SizedBox(height: 20.h),
                  // Results count
                  Text(
                    '${filtered.length} applicant${filtered.length != 1 ? 's' : ''} found',
                    style: AppTypography.smallText.copyWith(color: AppColors.neutral500),
                  ),
                  SizedBox(height: 12.h),
                  // Applicant list
                  if (filtered.isEmpty)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 48.h),
                        child: Column(
                          children: [
                            Icon(Icons.people_outline, size: 48.sp, color: AppColors.neutral300),
                            SizedBox(height: 12.h),
                            Text(
                              'No applicants found',
                              style: AppTypography.cardTitle.copyWith(color: AppColors.neutral400),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Try adjusting your filters',
                              style: AppTypography.smallText.copyWith(color: AppColors.neutral400),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ...filtered.map((applicant) => InkWell(
                          onTap: () => context.push('/ApplicationDetails'),
                          child: ApplicantCard(
                            name: applicant['name'] as String,
                            jobTitle: applicant['jobTitle'] as String,
                            location: applicant['location'] as String,
                            experience: applicant['experience'] as String,
                            matchScore: applicant['matchScore'] as double,
                            status: applicant['status'] as String,
                            skills: List<String>.from(applicant['skills'] as List),
                            appliedDate: applicant['appliedDate'] as String,
                            onViewProfile: () => context.push('/ApplicationDetails'),
                            onShortlist: () {},
                          ),
                        )),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
