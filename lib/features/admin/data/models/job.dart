class Job {
  final String companyName;
  final String jobTitle;
  final String jobType;
  final String date;
  final String status;
  final String expiresIn;
  final String jobLevel;
  final String salary;
  final String education;
  final String location;
  final List<String> skills;

  const Job({
    required this.companyName,
    required this.jobTitle,
    required this.jobType,
    required this.date,
    required this.status,
    required this.expiresIn,
    required this.jobLevel,
    required this.salary,
    required this.education,
    required this.location,
    required this.skills,
  });
}
