import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../business_logic/admin_filter.dart';
import '../../data/mock_data.dart';
import '../widgets/date_filter.dart';
import '../widgets/filter_chip.dart';
import '../widgets/pagination.dart';
import '../widgets/screen_headline.dart';
import '../widgets/search_field.dart';
import '../widgets/summary_card.dart';
import '../widgets/user_card.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  AdminFilterState _filter = const AdminFilterState();

  List<UserManagementData> get _filteredUsers => _filter.filterUsers(mockUsers);
  int get _totalPages => _filter.totalPages(_filteredUsers.length);
  List<UserManagementData> get _paginatedUsers => _filter.paginateUsers(_filteredUsers);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final summaryCards = getUserManagementSummary();

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
        padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadLine(message: 'User Management'),
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

              AppSearchField(
                hintText: 'Search by name company',
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

              Row(
                children: [
                  AppFilterChip(
                    label: 'All Statuses',
                    selectedValue: _filter.statusFilter,
                    options: const ['Active', 'InActive'],
                    onSelected: (value) {
                      setState(() {
                        _filter = _filter.copyWith(
                          statusFilter: () => value,
                          currentPage: 1,
                        );
                      });
                    },
                  ),
                  const SizedBox(width: AppSpacing.iconTextGap),
                  AppFilterChip(
                    label: 'User Type',
                    selectedValue: _filter.userTypeFilter,
                    options: const ['Company', 'Candidate'],
                    onSelected: (value) {
                      setState(() {
                        _filter = _filter.copyWith(
                          userTypeFilter: () => value,
                          currentPage: 1,
                        );
                      });
                    },
                  ),
                ],
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

              if (_filteredUsers.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
                  child: Center(
                    child: Text('No users found', style: textTheme.bodyMedium),
                  ),
                )
              else
                ..._paginatedUsers.map(
                  (user) => UserCard(
                    user: user,
                    onDelete: () {},
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
      );
  }
}
