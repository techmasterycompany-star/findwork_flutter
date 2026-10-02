export 'models/company_activation.dart';
export 'models/job.dart';
export 'models/summary_card_data.dart';
export 'models/user_management_data.dart';

import 'english_mock_data.dart' as en;
import 'models/company_activation.dart';
import 'models/job.dart';
import 'models/summary_card_data.dart';
import 'models/user_management_data.dart';

const _companyNames = {
  'Tech Solutions': 'تك سوليوشنز',
  'Digital World': 'ديجيتال وورلد',
  'Green Energy Co': 'شركة الطاقة الخضراء',
  'Health Plus': 'هيلث بلس',
  'EduLearn': 'إديو ليرن',
  'Foodie Hub': 'فودي هب',
  'Finance Pro': 'فاينانس برو',
  'TravelMate': 'ترافل ميت',
  'Style Studio': 'ستايل ستوديو',
  'BuildIt': 'بيلد إت',
  'CloudNine': 'كلاود ناين',
  'MediaWorks': 'ميديا ووركس',
  'AutoDrive': 'أوتو درايف',
  'PetCare': 'بيت كير',
  'LogiSwift': 'لوجي سويفت',
  'Tech Company': 'شركة تقنية',
};

const _peopleNames = {
  'Aya Ahmed': 'آية أحمد',
  'Mohamed Ali': 'محمد علي',
  'Sara Hassan': 'سارة حسن',
  'Omar Khalid': 'عمر خالد',
  'Nada Youssef': 'ندى يوسف',
  'Ahmed Mansour': 'أحمد منصور',
  'Fatma Ibrahim': 'فاطمة إبراهيم',
  'Youssef Karim': 'يوسف كريم',
  'Layla Abbas': 'ليلى عباس',
  'Hassan Farouk': 'حسن فاروق',
};

const _categories = {
  'Software/Technology': 'برمجيات/تقنية',
  'Renewable Energy': 'الطاقة المتجددة',
  'Healthcare': 'الرعاية الصحية',
  'Education': 'التعليم',
  'Food & Beverage': 'الأغذية والمشروبات',
  'Finance': 'التمويل',
  'Travel & Tourism': 'السفر والسياحة',
  'Fashion': 'الأزياء',
  'Construction': 'البناء',
  'Media & Entertainment': 'الإعلام والترفيه',
  'Automotive': 'السيارات',
  'Animal Care': 'رعاية الحيوانات',
  'Logistics': 'الخدمات اللوجستية',
};

const _industries = {
  'Software / SaaS': 'البرمجيات / البرمجيات كخدمة',
  'Renewable Energy': 'الطاقة المتجددة',
  'Healthcare / Medical': 'الرعاية الصحية / الطبية',
  'Education / E-Learning': 'التعليم / التعلم الإلكتروني',
  'Food & Beverage': 'الأغذية والمشروبات',
  'Finance / Banking': 'التمويل / البنوك',
  'Travel & Tourism': 'السفر والسياحة',
  'Fashion / Retail': 'الأزياء / التجزئة',
  'Construction / Real Estate': 'البناء / العقارات',
  'Media & Entertainment': 'الإعلام والترفيه',
  'Automotive / Technology': 'السيارات / التقنية',
  'Animal Care / Services': 'رعاية الحيوانات / الخدمات',
  'Logistics / Supply Chain': 'اللوجستيات / سلاسل الإمداد',
};

const _locations = {
  'Cairo, Egypt': 'القاهرة، مصر',
  'Alexandria, Egypt': 'الإسكندرية، مصر',
  'Giza, Egypt': 'الجيزة، مصر',
  'Luxor, Egypt': 'الأقصر، مصر',
  'Hurghada, Egypt': 'الغردقة، مصر',
  'Dhaka, Bangladesh': 'دكا، بنغلاديش',
};

const _documents = {
  'Business License': 'رخصة تجارية',
  'Tax Registration': 'تسجيل ضريبي',
  'ISO Certificate': 'شهادة ISO',
  'Environmental Certification': 'شهادة بيئية',
  'Medical License': 'ترخيص طبي',
  'Food Safety Certificate': 'شهادة سلامة الغذاء',
  'Financial License': 'ترخيص مالي',
  'Tourism License': 'ترخيص سياحي',
  'Construction Permit': 'تصريح بناء',
  'Media License': 'ترخيص إعلامي',
  'Technical Certification': 'شهادة تقنية',
  'Veterinary License': 'ترخيص بيطري',
};

const _descriptions = {
  'Tech Solutions': 'نبني حلولا برمجية مبتكرة تساعد الشركات على النمو والنجاح.',
  'Digital World': 'وكالة رقمية متكاملة متخصصة في تطوير الويب وتطبيقات الهاتف.',
  'Green Energy Co':
      'مزود رائد لحلول الطاقة المتجددة للاستخدام السكني والتجاري.',
  'Health Plus': 'منصة رعاية صحية تقدم خدمات الطب عن بعد والعناية بالصحة.',
  'EduLearn': 'منصة تعليم إلكتروني تقدم دورات وشهادات احترافية.',
  'Foodie Hub': 'خدمات توصيل طعام وتموين تربط المطاعم بالعملاء.',
  'Finance Pro': 'استشارات مالية وإدارة استثمار للشركات.',
  'TravelMate': 'وكالة سفر تقدم رحلات وباقات عطلات مختارة.',
  'Style Studio': 'استوديو تصميم أزياء يقدم خطوط ملابس عصرية.',
  'BuildIt': 'شركة بناء متخصصة في المشاريع السكنية والتجارية.',
  'CloudNine': 'حلول بنية سحابية وDevOps للشركات الكبرى.',
  'MediaWorks': 'شركة إنتاج إعلامي تنشئ محتوى رقميا وإعلانات.',
  'AutoDrive': 'شركة تقنية سيارات تطور أنظمة قيادة ذاتية.',
  'PetCare': 'خدمات رعاية تشمل العناية والإقامة والرعاية البيطرية.',
  'LogiSwift': 'حلول توصيل ولوجستيات للميل الأخير لشركات التجارة الإلكترونية.',
};

const _roles = {
  'UI/UX Designer': 'مصمم واجهات وتجربة مستخدم',
  'Backend Developer': 'مطوّر خلفية',
  'Product Manager': 'مدير منتج',
  'Data Analyst': 'محلل بيانات',
  'Marketing Specialist': 'أخصائي تسويق',
  'DevOps Engineer': 'مهندس DevOps',
  'Content Writer': 'كاتب محتوى',
  'Mobile Developer': 'مطوّر تطبيقات هاتف',
  'QA Engineer': 'مهندس جودة',
  'Graphic Designer': 'مصمم جرافيك',
};

const _jobTitles = {
  'UI/UX Designer': 'مصمم واجهات وتجربة مستخدم',
  'Frontend Developer': 'مطوّر واجهات أمامية',
  'Project Manager': 'مدير مشروع',
  'Data Analyst': 'محلل بيانات',
  'Content Writer': 'كاتب محتوى',
  'Marketing Specialist': 'أخصائي تسويق',
  'Accountant': 'محاسب',
  'Tour Guide': 'مرشد سياحي',
  'Fashion Designer': 'مصمم أزياء',
  'Civil Engineer': 'مهندس مدني',
  'DevOps Engineer': 'مهندس DevOps',
  'Video Editor': 'مونتير فيديو',
};

const _jobTypes = {
  'Full-time': 'دوام كامل',
  'Remote': 'عن بعد',
  'Part-time': 'دوام جزئي',
  'Contract': 'تعاقد',
};

const _jobLevels = {
  'Entry Level': 'مبتدئ',
  'Mid Level': 'متوسط الخبرة',
  'Senior Level': 'خبير',
};

const _education = {
  "Bachelor's": 'بكالوريوس',
  "Master's": 'ماجستير',
  'High School': 'ثانوية عامة',
  'Diploma': 'دبلوم',
};

const _skills = {
  'Web Design': 'تصميم ويب',
  'Figma': 'فيجما',
  'User Interface Design': 'تصميم واجهات المستخدم',
  'User Experience': 'تجربة المستخدم',
  'Flutter': 'Flutter',
  'Dart': 'Dart',
  'React': 'React',
  'TypeScript': 'TypeScript',
  'Project Management': 'إدارة المشاريع',
  'Agile': 'Agile',
  'Scrum': 'Scrum',
  'Leadership': 'القيادة',
  'SQL': 'SQL',
  'Python': 'Python',
  'Excel': 'Excel',
  'Data Visualization': 'تصوير البيانات',
  'Content Writing': 'كتابة المحتوى',
  'SEO': 'تحسين محركات البحث',
  'Copywriting': 'كتابة إعلانية',
  'Editing': 'تحرير',
  'Digital Marketing': 'تسويق رقمي',
  'Social Media': 'وسائل التواصل',
  'Analytics': 'تحليلات',
  'Content Strategy': 'استراتيجية المحتوى',
  'Accounting': 'محاسبة',
  'Financial Reporting': 'تقارير مالية',
  'QuickBooks': 'QuickBooks',
  'Customer Service': 'خدمة العملاء',
  'Languages': 'لغات',
  'Communication': 'تواصل',
  'Tourism Knowledge': 'معرفة سياحية',
  'Fashion Design': 'تصميم أزياء',
  'Adobe Illustrator': 'Adobe Illustrator',
  'Pattern Making': 'إعداد الباترون',
  'Textile Knowledge': 'معرفة بالأقمشة',
  'AutoCAD': 'AutoCAD',
  'Structural Analysis': 'تحليل إنشائي',
  'Construction': 'بناء',
  'AWS': 'AWS',
  'Docker': 'Docker',
  'Kubernetes': 'Kubernetes',
  'CI/CD': 'CI/CD',
  'Premiere Pro': 'Premiere Pro',
  'After Effects': 'After Effects',
  'DaVinci Resolve': 'DaVinci Resolve',
  'Color Grading': 'تصحيح الألوان',
};

String _companyName(String value) => _companyNames[value] ?? value;
String _personName(String value) => _peopleNames[value] ?? value;
String _category(String value) => _categories[value] ?? value;
String _industry(String value) => _industries[value] ?? value;
String _location(String value) => _locations[value] ?? value;
String _role(String value) => _roles[value] ?? _category(value);
String _jobTitle(String value) => _jobTitles[value] ?? value;
String _jobType(String value) => _jobTypes[value] ?? value;
String _jobLevel(String value) => _jobLevels[value] ?? value;
String _educationValue(String value) => _education[value] ?? value;
String _skill(String value) => _skills[value] ?? value;

final List<CompanyActivation> mockCompanyActivations = en.mockCompanyActivations
    .map((company) {
      return CompanyActivation(
        name: _companyName(company.name),
        category: _category(company.category),
        date: company.date,
        status: company.status,
        email: company.email,
        phone: company.phone,
        description: _descriptions[company.name] ?? company.description,
        industry: _industry(company.industry),
        companySize: company.companySize.replaceAll('employees', 'موظف'),
        website: company.website,
        location: _location(company.location),
        documents: company.documents
            .map((document) => _documents[document] ?? document)
            .toList(),
      );
    })
    .toList();

final List<UserManagementData> mockUsers = en.mockUsers.map((user) {
  return UserManagementData(
    name: user.isCompany ? _companyName(user.name) : _personName(user.name),
    role: _role(user.role),
    date: user.date,
    status: user.status,
    isCompany: user.isCompany,
  );
}).toList();

final List<Job> mockJobs = en.mockJobs.map((job) {
  return Job(
    companyName: _companyName(job.companyName),
    jobTitle: _jobTitle(job.jobTitle),
    jobType: _jobType(job.jobType),
    date: job.date,
    status: job.status,
    expiresIn: job.expiresIn,
    jobLevel: _jobLevel(job.jobLevel),
    salary: job.salary == 'Not Specified' ? 'غير محدد' : job.salary,
    education: _educationValue(job.education),
    location: _location(job.location),
    skills: job.skills.map(_skill).toList(),
  );
}).toList();

List<SummaryCardData> getCompanyActivationSummary() {
  final pending = mockCompanyActivations
      .where((c) => c.status == 'Pending')
      .length;
  final active = mockCompanyActivations
      .where((c) => c.status == 'Active')
      .length;
  final rejected = mockCompanyActivations
      .where((c) => c.status == 'Rejected')
      .length;
  final total = mockCompanyActivations.length;

  return [
    SummaryCardData(
      title: 'بانتظار التفعيل',
      number: '$pending',
      subTitle: 'تحتاج إلى مراجعتك',
    ),
    SummaryCardData(
      title: 'شركات مفعلة',
      number: '$active',
      subTitle: 'شركات تم تفعيلها',
    ),
    SummaryCardData(
      title: 'مرفوضة',
      number: '$rejected',
      subTitle: 'شركات مرفوضة',
    ),
    SummaryCardData(
      title: 'إجمالي الشركات',
      number: '$total',
      subTitle: 'كل الشركات',
    ),
  ];
}

List<SummaryCardData> getUserManagementSummary() {
  final total = mockUsers.length;
  final active = mockUsers.where((u) => u.status == 'Active').length;
  final candidates = mockUsers.where((u) => !u.isCompany).length;
  final employers = mockUsers.where((u) => u.isCompany).length;

  return [
    SummaryCardData(
      title: 'إجمالي المستخدمين',
      number: '$total',
      subTitle: '+12% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'مستخدمون نشطون',
      number: '$active',
      subTitle: '+8.1% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'المرشحون',
      number: '$candidates',
      subTitle: '+85.5% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'أصحاب العمل',
      number: '$employers',
      subTitle: '+8.1% من الأسبوع الماضي',
    ),
  ];
}

List<SummaryCardData> getJobManagementSummary() {
  final total = mockJobs.length;
  final pending = mockJobs.where((j) => j.status == 'Pending').length;
  final approved = mockJobs.where((j) => j.status == 'Accepted').length;
  final rejected = mockJobs.where((j) => j.status == 'Rejected').length;

  return [
    SummaryCardData(
      title: 'إجمالي الوظائف',
      number: '$total',
      subTitle: '+12% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'بانتظار الموافقة',
      number: '$pending',
      subTitle: '2% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'تمت الموافقة',
      number: '$approved',
      subTitle: '71% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'مرفوضة',
      number: '$rejected',
      subTitle: '10% من الأسبوع الماضي',
    ),
  ];
}

List<SummaryCardData> getOverviewSummary() {
  final pendingCompanies = mockCompanyActivations
      .where((c) => c.status == 'Pending')
      .length;
  final pendingJobs = mockJobs.where((j) => j.status == 'Pending').length;
  final totalJobs = mockJobs.length;
  final totalUsers = mockUsers.length;

  return [
    SummaryCardData(
      title: 'شركات للتفعيل',
      number: '$pendingCompanies',
      subTitle: 'مراجعة الحسابات',
    ),
    SummaryCardData(
      title: 'وظائف معلقة',
      number: '$pendingJobs',
      subTitle: 'مراجعة الوظائف',
    ),
    SummaryCardData(
      title: 'إجمالي الوظائف',
      number: '$totalJobs',
      subTitle: '+12% من الأسبوع الماضي',
    ),
    SummaryCardData(
      title: 'إجمالي المستخدمين',
      number: '$totalUsers',
      subTitle: '+8.1% من الأسبوع الماضي',
    ),
  ];
}
