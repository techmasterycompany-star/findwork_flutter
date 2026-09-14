import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../business_logic/admin_filter.dart';
import '../../data/mock_data.dart';
import '../widgets/job_management_card.dart';
import '../widgets/job_management_detail.dart';
import '../widgets/job_management_tabs.dart';
import '../widgets/date_filter.dart';
import '../widgets/pagination.dart';
import '../widgets/screen_headline.dart';
import '../widgets/search_field.dart';
import '../widgets/summary_card.dart';

class JobManagementScreen extends StatefulWidget {
  const JobManagementScreen({super.key});

  @override
  State<JobManagementScreen> createState() => _JobManagementScreenState();
}

class _JobManagementScreenState extends State<JobManagementScreen> {
  AdminFilterState _filter = const AdminFilterState();

  List<Job> get _pendingJobs =>
      mockJobs.where((j) => j.status == 'Pending' || j.status == 'Rejected').toList();
  List<Job> get _filteredJobs => _filter.filterJobs(_pendingJobs);
  int get _totalPages => _filter.totalPages(_filteredJobs.length);
  List<Job> get _paginatedJobs => _filter.paginateJobs(_filteredJobs);

  int get _pendingCount => _pendingJobs.where((j) => j.status == 'Pending').length;
  int get _approvedCount => mockJobs.where((j) => j.status == 'Accepted').length;

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final summaryCards = getJobManagementSummary();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadLine(message: 'Job Management'),
              AppSpacing.vertical24,

              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.cardGapSmall,
                crossAxisSpacing: AppSpacing.cardGapSmall,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < summaryCards.length; i++)
                    SummaryCard(
                      title: summaryCards[i].title,
                      number: summaryCards[i].number,
                      subTitle: summaryCards[i].subTitle,
                      isFirst: i == 0,
                    ),
                ],
              ),
              AppSpacing.vertical24,

              JobManagementTabs(
                statusFilter: _filter.statusFilter,
                onStatusFilterChanged: (value) {
                  setState(() {
                    _filter = _filter.copyWith(
                      statusFilter: () => value,
                      currentPage: 1,
                    );
                  });
                },
                pendingCount: _pendingCount,
                approvedCount: _approvedCount,
                totalCount: _pendingJobs.length,
              ),
              AppSpacing.vertical24,

              AppSearchField(
                hintText: 'Search by company name...',
                searchQuery: _filter.searchQuery,
                onChanged: (value) {
                  setState(() {
                    _filter = _filter.copyWith(
                      searchQuery: value,
                      currentPage: 1,
                    );
                  });
                },
              ),
              AppSpacing.vertical20,

              AppDateFilter(
                selectedDate: _filter.selectedDate,
                onDateChanged: (date) {
                  setState(() {
                    _filter = _filter.copyWith(
                      selectedDate: () => date,
                      currentPage: 1,
                    );
                  });
                },
              ),
              AppSpacing.vertical20,

              if (_filteredJobs.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
                  child: Center(
                    child: Text('No jobs found', style: textTheme.bodyMedium),
                  ),
                )
              else
                ..._paginatedJobs.map(
                  (job) => JobManagementCard(
                    job: job,
                    onReview: () {
                      JobManagementDetail.show(
                        context,
                        job: job,
                        onApprove: () {
                          _showSnackbar('${job.jobTitle} at ${job.companyName} has been approved');
                        },
                        onReject: () {
                          _showSnackbar('${job.jobTitle} at ${job.companyName} has been rejected');
                        },
                      );
                    },
                  ),
                ),

              AppSpacing.vertical24,
              AppPagination(
                currentPage: _filter.currentPage,
                totalPages: _totalPages,
                onPageChanged: (page) {
                  setState(() {
                    _filter = _filter.copyWith(currentPage: page);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
