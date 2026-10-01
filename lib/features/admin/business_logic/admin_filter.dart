import '../data/models/company_activation.dart';
import '../data/models/job.dart';
import '../data/models/user_management_data.dart';

class AdminFilterState {
  final String searchQuery;
  final String? statusFilter;
  final String? userTypeFilter;
  final String? selectedDate;
  final int currentPage;
  final int itemsPerPage;

  const AdminFilterState({
    this.searchQuery = '',
    this.statusFilter,
    this.userTypeFilter,
    this.selectedDate,
    this.currentPage = 1,
    this.itemsPerPage = 4,
  });

  AdminFilterState copyWith({
    String? searchQuery,
    String? Function()? statusFilter,
    String? Function()? userTypeFilter,
    String? Function()? selectedDate,
    int? currentPage,
    int? itemsPerPage,
  }) {
    return AdminFilterState(
      searchQuery: searchQuery ?? this.searchQuery,
      statusFilter: statusFilter != null ? statusFilter() : this.statusFilter,
      userTypeFilter: userTypeFilter != null ? userTypeFilter() : this.userTypeFilter,
      selectedDate: selectedDate != null ? selectedDate() : this.selectedDate,
      currentPage: currentPage ?? this.currentPage,
      itemsPerPage: itemsPerPage ?? this.itemsPerPage,
    );
  }

  List<CompanyActivation> filterCompanies(List<CompanyActivation> companies) {
    return companies.where((company) {
      final matchesSearch = searchQuery.isEmpty ||
          company.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus =
          statusFilter == null || company.status == statusFilter;
      final matchesDate = selectedDate == null || company.date == selectedDate;
      return matchesSearch && matchesStatus && matchesDate;
    }).toList();
  }

  List<UserManagementData> filterUsers(List<UserManagementData> users) {
    return users.where((user) {
      final matchesSearch = searchQuery.isEmpty ||
          user.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus =
          statusFilter == null || user.status == statusFilter;
      final matchesType = userTypeFilter == null ||
          (userTypeFilter == 'Company' && user.isCompany) ||
          (userTypeFilter == 'Candidate' && !user.isCompany);
      final matchesDate = selectedDate == null || user.date == selectedDate;
      return matchesSearch && matchesStatus && matchesType && matchesDate;
    }).toList();
  }

  List<CompanyActivation> paginateCompanies(List<CompanyActivation> list) {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    if (startIndex >= list.length) return [];
    return list.sublist(
      startIndex,
      endIndex > list.length ? list.length : endIndex,
    );
  }

  List<UserManagementData> paginateUsers(List<UserManagementData> list) {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    if (startIndex >= list.length) return [];
    return list.sublist(
      startIndex,
      endIndex > list.length ? list.length : endIndex,
    );
  }

  List<Job> filterJobs(List<Job> jobs) {
    return jobs.where((job) {
      final matchesSearch = searchQuery.isEmpty ||
          job.companyName.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesStatus =
          statusFilter == null || job.status == statusFilter;
      final matchesDate = selectedDate == null || job.date == selectedDate;
      return matchesSearch && matchesStatus && matchesDate;
    }).toList();
  }

  List<Job> paginateJobs(List<Job> list) {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = startIndex + itemsPerPage;
    if (startIndex >= list.length) return [];
    return list.sublist(
      startIndex,
      endIndex > list.length ? list.length : endIndex,
    );
  }

  int totalPages(int totalItems) {
    if (totalItems == 0) return 0;
    return (totalItems / itemsPerPage).ceil();
  }
}
