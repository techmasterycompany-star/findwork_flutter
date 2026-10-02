class CompanyActivation {
  final String name;
  final String category;
  final String date;
  final String status;
  final String email;
  final String phone;
  final String description;
  final String industry;
  final String companySize;
  final String website;
  final String location;
  final List<String> documents;

  const CompanyActivation({
    required this.name,
    required this.category,
    required this.date,
    required this.status,
    required this.email,
    required this.phone,
    required this.description,
    required this.industry,
    required this.companySize,
    required this.website,
    required this.location,
    required this.documents,
  });
}
