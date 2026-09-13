import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../business_logic/admin_filter.dart';
import '../../data/mock_data.dart';
import '../widgets/company_activation_card.dart';
import '../widgets/company_activation_detail.dart';
import '../widgets/company_activation_tabs.dart';
import '../widgets/date_filter.dart';
import '../widgets/pagination.dart';
import '../widgets/screen_headline.dart';
import '../widgets/search_field.dart';
import '../widgets/summary_card.dart';

class CompanyActivationScreen extends StatefulWidget {
  const CompanyActivationScreen({super.key});

  @override
  State<CompanyActivationScreen> createState() => _CompanyActivationScreenState();
}

class _CompanyActivationScreenState extends State<CompanyActivationScreen> {
  AdminFilterState _filter = const AdminFilterState();

  List<CompanyActivation> get _reviewCompanies =>
      mockCompanyActivations.where((c) => c.status != 'Active').toList();
  List<CompanyActivation> get _filteredCompanies => _filter.filterCompanies(_reviewCompanies);
  int get _totalPages => _filter.totalPages(_filteredCompanies.length);
  List<CompanyActivation> get _paginatedCompanies => _filter.paginateCompanies(_filteredCompanies);

  int get _pendingCount => _reviewCompanies.where((c) => c.status == 'Pending').length;
  int get _rejectedCount => _reviewCompanies.where((c) => c.status == 'Rejected').length;

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final summaryCards = getCompanyActivationSummary();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadLine(message: 'Company Activations'),
              SizedBox(height: AppSpacing.sectionInternalPadding),

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
              SizedBox(height: AppSpacing.sectionInternalPadding),

              CompanyActivationTabs(
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
                rejectedCount: _rejectedCount,
                totalCount: _reviewCompanies.length,
              ),
              SizedBox(height: AppSpacing.sectionInternalPadding),

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
              SizedBox(height: AppSpacing.cardGapSmall),

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
              SizedBox(height: AppSpacing.cardGapSmall),

              if (_filteredCompanies.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
                  child: Center(
                    child: Text('No companies found', style: textTheme.bodyMedium),
                  ),
                )
              else
                ..._paginatedCompanies.map(
                  (company) => CompanyActivationCard(
                    company: company,
                    onReview: () {
                      CompanyActivationDetail.show(
                        context,
                        company: company,
                        onActivate: () {
                          _showSnackbar('${company.name} has been activated successfully');
                        },
                        onReject: () {
                          _showSnackbar('${company.name} has been rejected');
                        },
                      );
                    },
                  ),
                ),

              SizedBox(height: AppSpacing.sectionInternalPadding),
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
