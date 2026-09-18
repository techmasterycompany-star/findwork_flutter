// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Active Jobs Today`
  String get Active {
    return Intl.message(
      'Active Jobs Today',
      name: 'Active',
      desc: '',
      args: [],
    );
  }

  /// `Good morning, Jonathan`
  String get Welcome {
    return Intl.message(
      'Good morning, Jonathan',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `You have 3 new recommended roles matching your profile and 2 active interviews scheduled this week.`
  String get welcomeDeception {
    return Intl.message(
      'You have 3 new recommended roles matching your profile and 2 active interviews scheduled this week.',
      name: 'welcomeDeception',
      desc: '',
      args: [],
    );
  }

  /// `Job title`
  String get search {
    return Intl.message('Job title', name: 'search', desc: '', args: []);
  }

  /// `Popular Searches:`
  String get Popular {
    return Intl.message(
      'Popular Searches:',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `Financial Analyst`
  String get Financial {
    return Intl.message(
      'Financial Analyst',
      name: 'Financial',
      desc: '',
      args: [],
    );
  }

  /// `Designer`
  String get Designer {
    return Intl.message('Designer', name: 'Designer', desc: '', args: []);
  }

  /// `Developer`
  String get Developer {
    return Intl.message('Developer', name: 'Developer', desc: '', args: []);
  }

  /// `Team Leader`
  String get TeamLeader {
    return Intl.message('Team Leader', name: 'TeamLeader', desc: '', args: []);
  }

  /// `Fullstack`
  String get Fullstack {
    return Intl.message('Fullstack', name: 'Fullstack', desc: '', args: []);
  }

  /// `Jonathan Doe`
  String get name {
    return Intl.message('Jonathan Doe', name: 'name', desc: '', args: []);
  }

  /// `Product Designer & UI Specialist`
  String get jobTitle {
    return Intl.message(
      'Product Designer & UI Specialist',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `asset/images/user-avatar.png`
  String get imageUrl {
    return Intl.message(
      'asset/images/user-avatar.png',
      name: 'imageUrl',
      desc: '',
      args: [],
    );
  }

  /// `Active matches`
  String get label {
    return Intl.message('Active matches', name: 'label', desc: '', args: []);
  }

  /// `Applied roles`
  String get label2 {
    return Intl.message('Applied roles', name: 'label2', desc: '', args: []);
  }

  /// `Interviews`
  String get label3 {
    return Intl.message('Interviews', name: 'label3', desc: '', args: []);
  }

  /// `Senior UI/UX Designer`
  String get title {
    return Intl.message(
      'Senior UI/UX Designer',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Tech Company`
  String get company {
    return Intl.message('Tech Company', name: 'company', desc: '', args: []);
  }

  /// `Canada`
  String get location {
    return Intl.message('Canada', name: 'location', desc: '', args: []);
  }

  /// `1 hour ago`
  String get postedTime {
    return Intl.message('1 hour ago', name: 'postedTime', desc: '', args: []);
  }

  /// `Full-Time`
  String get typeJob {
    return Intl.message('Full-Time', name: 'typeJob', desc: '', args: []);
  }

  /// `Hybrid`
  String get jobplace {
    return Intl.message('Hybrid', name: 'jobplace', desc: '', args: []);
  }

  /// `Design, iterate and scale robust web/mobile applications with a high degree of autonomy...`
  String get jobDescription {
    return Intl.message(
      'Design, iterate and scale robust web/mobile applications with a high degree of autonomy...',
      name: 'jobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Backend Developer`
  String get title2 {
    return Intl.message(
      'Backend Developer',
      name: 'title2',
      desc: '',
      args: [],
    );
  }

  /// `Creative Agency`
  String get company2 {
    return Intl.message(
      'Creative Agency',
      name: 'company2',
      desc: '',
      args: [],
    );
  }

  /// `Canada`
  String get location2 {
    return Intl.message('Canada', name: 'location2', desc: '', args: []);
  }

  /// `1 hour ago`
  String get postedTime2 {
    return Intl.message('1 hour ago', name: 'postedTime2', desc: '', args: []);
  }

  /// `Part-Time`
  String get typeJob2 {
    return Intl.message('Part-Time', name: 'typeJob2', desc: '', args: []);
  }

  /// `Remote`
  String get jobplace2 {
    return Intl.message('Remote', name: 'jobplace2', desc: '', args: []);
  }

  /// `Optimize APIs and orchestrate cloud databases. Looking for experienced Node.js developers...`
  String get jobDescription2 {
    return Intl.message(
      'Optimize APIs and orchestrate cloud databases. Looking for experienced Node.js developers...',
      name: 'jobDescription2',
      desc: '',
      args: [],
    );
  }

  /// `View all 24 recommendations → `
  String get recommendations {
    return Intl.message(
      'View all 24 recommendations → ',
      name: 'recommendations',
      desc: '',
      args: [],
    );
  }

  /// `Job4U is a smart job search and recruitment platform that connects job seekers with employers. Find your next opportunity today.`
  String get description {
    return Intl.message(
      'Job4U is a smart job search and recruitment platform that connects job seekers with employers. Find your next opportunity today.',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `For Candidates`
  String get title3 {
    return Intl.message('For Candidates', name: 'title3', desc: '', args: []);
  }

  /// `Find Job`
  String get links {
    return Intl.message('Find Job', name: 'links', desc: '', args: []);
  }

  /// `Create Resume`
  String get links2 {
    return Intl.message('Create Resume', name: 'links2', desc: '', args: []);
  }

  /// `Job Alerts`
  String get links3 {
    return Intl.message('Job Alerts', name: 'links3', desc: '', args: []);
  }

  /// `Saved Jobs`
  String get links4 {
    return Intl.message('Saved Jobs', name: 'links4', desc: '', args: []);
  }

  /// `Create Account`
  String get links5 {
    return Intl.message('Create Account', name: 'links5', desc: '', args: []);
  }

  /// `For Employers`
  String get title4 {
    return Intl.message('For Employers', name: 'title4', desc: '', args: []);
  }

  /// `Post a Job`
  String get links6 {
    return Intl.message('Post a Job', name: 'links6', desc: '', args: []);
  }

  /// `Talent Search`
  String get links7 {
    return Intl.message('Talent Search', name: 'links7', desc: '', args: []);
  }

  /// `Enterprise Solutions`
  String get links8 {
    return Intl.message(
      'Enterprise Solutions',
      name: 'links8',
      desc: '',
      args: [],
    );
  }

  /// `Pricing Plans`
  String get links9 {
    return Intl.message('Pricing Plans', name: 'links9', desc: '', args: []);
  }

  /// `Success Stories`
  String get links10 {
    return Intl.message('Success Stories', name: 'links10', desc: '', args: []);
  }

  /// `Resources`
  String get title5 {
    return Intl.message('Resources', name: 'title5', desc: '', args: []);
  }

  /// `Resources`
  String get links11 {
    return Intl.message('Resources', name: 'links11', desc: '', args: []);
  }

  /// `Help Center`
  String get links12 {
    return Intl.message('Help Center', name: 'links12', desc: '', args: []);
  }

  /// `Guideline`
  String get links13 {
    return Intl.message('Guideline', name: 'links13', desc: '', args: []);
  }

  /// `Contact Support`
  String get links14 {
    return Intl.message('Contact Support', name: 'links14', desc: '', args: []);
  }

  /// `© 2026 Job4U. All rights reserved.`
  String get Job4U {
    return Intl.message(
      '© 2026 Job4U. All rights reserved.',
      name: 'Job4U',
      desc: '',
      args: [],
    );
  }

  /// `View Interview Prep`
  String get View {
    return Intl.message(
      'View Interview Prep',
      name: 'View',
      desc: '',
      args: [],
    );
  }

  /// `How Job4U Works`
  String get howWorks {
    return Intl.message(
      'How Job4U Works',
      name: 'howWorks',
      desc: '',
      args: [],
    );
  }

  /// `Find your dream job in just a few simple steps`
  String get finddreamjob {
    return Intl.message(
      'Find your dream job in just a few simple steps',
      name: 'finddreamjob',
      desc: '',
      args: [],
    );
  }

  /// `Step 01`
  String get step {
    return Intl.message('Step 01', name: 'step', desc: '', args: []);
  }

  /// `Create Account`
  String get title6 {
    return Intl.message('Create Account', name: 'title6', desc: '', args: []);
  }

  /// `Sign up for free and build your professional candidate profile in minutes.`
  String get description2 {
    return Intl.message(
      'Sign up for free and build your professional candidate profile in minutes.',
      name: 'description2',
      desc: '',
      args: [],
    );
  }

  /// `Step 02`
  String get step2 {
    return Intl.message('Step 02', name: 'step2', desc: '', args: []);
  }

  /// `Upload CV/Resume`
  String get title7 {
    return Intl.message('Upload CV/Resume', name: 'title7', desc: '', args: []);
  }

  /// `Upload your latest CV so employers can discover your skills easily.`
  String get description3 {
    return Intl.message(
      'Upload your latest CV so employers can discover your skills easily.',
      name: 'description3',
      desc: '',
      args: [],
    );
  }

  /// `Step 03`
  String get step3 {
    return Intl.message('Step 03', name: 'step3', desc: '', args: []);
  }

  /// `Find Suitable Job`
  String get title8 {
    return Intl.message(
      'Find Suitable Job',
      name: 'title8',
      desc: '',
      args: [],
    );
  }

  /// `Browse thousands of curated job listings that match your expertise.`
  String get description4 {
    return Intl.message(
      'Browse thousands of curated job listings that match your expertise.',
      name: 'description4',
      desc: '',
      args: [],
    );
  }

  /// `Step 04`
  String get step4 {
    return Intl.message('Step 04', name: 'step4', desc: '', args: []);
  }

  /// `Apply Job`
  String get title9 {
    return Intl.message('Apply Job', name: 'title9', desc: '', args: []);
  }

  /// `One-click apply to your favorite roles and track every application in real time.`
  String get description5 {
    return Intl.message(
      'One-click apply to your favorite roles and track every application in real time.',
      name: 'description5',
      desc: '',
      args: [],
    );
  }

  /// `Active Applications`
  String get title10 {
    return Intl.message(
      'Active Applications',
      name: 'title10',
      desc: '',
      args: [],
    );
  }

  /// `Real-time status updates on roles you have applied for.`
  String get description6 {
    return Intl.message(
      'Real-time status updates on roles you have applied for.',
      name: 'description6',
      desc: '',
      args: [],
    );
  }

  /// `UI/UX Designer`
  String get jobTitle1 {
    return Intl.message(
      'UI/UX Designer',
      name: 'jobTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Tech Company`
  String get company1 {
    return Intl.message('Tech Company', name: 'company1', desc: '', args: []);
  }

  /// `Applied 3 days ago`
  String get appliedTime1 {
    return Intl.message(
      'Applied 3 days ago',
      name: 'appliedTime1',
      desc: '',
      args: [],
    );
  }

  /// `Interview Scheduled`
  String get status1 {
    return Intl.message(
      'Interview Scheduled',
      name: 'status1',
      desc: '',
      args: [],
    );
  }

  /// `Stripe`
  String get jobTitle2 {
    return Intl.message('Stripe', name: 'jobTitle2', desc: '', args: []);
  }

  /// `Product Designer`
  String get company3 {
    return Intl.message(
      'Product Designer',
      name: 'company3',
      desc: '',
      args: [],
    );
  }

  /// `Applied 2 weeks ago`
  String get appliedTime2 {
    return Intl.message(
      'Applied 2 weeks ago',
      name: 'appliedTime2',
      desc: '',
      args: [],
    );
  }

  /// `Resume Submitted`
  String get status2 {
    return Intl.message(
      'Resume Submitted',
      name: 'status2',
      desc: '',
      args: [],
    );
  }

  /// `Backend Developer`
  String get jobTitle3 {
    return Intl.message(
      'Backend Developer',
      name: 'jobTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Financial Firm`
  String get company4 {
    return Intl.message('Financial Firm', name: 'company4', desc: '', args: []);
  }

  /// `Applied 1 weeks ago`
  String get appliedTime3 {
    return Intl.message(
      'Applied 1 weeks ago',
      name: 'appliedTime3',
      desc: '',
      args: [],
    );
  }

  /// `Screening`
  String get status3 {
    return Intl.message('Screening', name: 'status3', desc: '', args: []);
  }

  /// `Active Candidate`
  String get activeCandidate {
    return Intl.message(
      'Active Candidate',
      name: 'activeCandidate',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Grow Your Freelance Career`
  String get growYourFreelanceCareer {
    return Intl.message(
      'Grow Your Freelance Career',
      name: 'growYourFreelanceCareer',
      desc: '',
      args: [],
    );
  }

  /// `Expert insights and high-demand trending skills to level up your work.`
  String get freelanceCareerDescription {
    return Intl.message(
      'Expert insights and high-demand trending skills to level up your work.',
      name: 'freelanceCareerDescription',
      desc: '',
      args: [],
    );
  }

  /// `GUIDES`
  String get category1 {
    return Intl.message('GUIDES', name: 'category1', desc: '', args: []);
  }

  /// `5 min read`
  String get readTime1 {
    return Intl.message('5 min read', name: 'readTime1', desc: '', args: []);
  }

  /// `How to negotiate freelance rates with corporate clients`
  String get title1 {
    return Intl.message(
      'How to negotiate freelance rates with corporate clients',
      name: 'title1',
      desc: '',
      args: [],
    );
  }

  /// `PORTFOLIO`
  String get category2 {
    return Intl.message('PORTFOLIO', name: 'category2', desc: '', args: []);
  }

  /// `8 min read`
  String get readTime2 {
    return Intl.message('8 min read', name: 'readTime2', desc: '', args: []);
  }

  /// `Top 5 portfolio adjustments to secure remote contracts`
  String get title11 {
    return Intl.message(
      'Top 5 portfolio adjustments to secure remote contracts',
      name: 'title11',
      desc: '',
      args: [],
    );
  }

  /// `FINANCE`
  String get category3 {
    return Intl.message('FINANCE', name: 'category3', desc: '', args: []);
  }

  /// `12 min read`
  String get readTime3 {
    return Intl.message('12 min read', name: 'readTime3', desc: '', args: []);
  }

  /// `Understanding international freelance tax regulations`
  String get title12 {
    return Intl.message(
      'Understanding international freelance tax regulations',
      name: 'title12',
      desc: '',
      args: [],
    );
  }

  /// `Read Article →`
  String get readArticle {
    return Intl.message(
      'Read Article →',
      name: 'readArticle',
      desc: '',
      args: [],
    );
  }

  /// `High Demand Skills`
  String get highDemandSkills {
    return Intl.message(
      'High Demand Skills',
      name: 'highDemandSkills',
      desc: '',
      args: [],
    );
  }

  /// `Top matching skills currently searched by tech hirers`
  String get topMatchingSkills {
    return Intl.message(
      'Top matching skills currently searched by tech hirers',
      name: 'topMatchingSkills',
      desc: '',
      args: [],
    );
  }

  /// `Tailwind CSS`
  String get skillName1 {
    return Intl.message('Tailwind CSS', name: 'skillName1', desc: '', args: []);
  }

  /// `+34% this month`
  String get growth1 {
    return Intl.message('+34% this month', name: 'growth1', desc: '', args: []);
  }

  /// `412`
  String get jobs1 {
    return Intl.message('412', name: 'jobs1', desc: '', args: []);
  }

  /// `TypeScript`
  String get skillName2 {
    return Intl.message('TypeScript', name: 'skillName2', desc: '', args: []);
  }

  /// `+45% this month`
  String get growth2 {
    return Intl.message('+45% this month', name: 'growth2', desc: '', args: []);
  }

  /// `812`
  String get jobs2 {
    return Intl.message('812', name: 'jobs2', desc: '', args: []);
  }

  /// `Next.js Framework`
  String get skillName3 {
    return Intl.message(
      'Next.js Framework',
      name: 'skillName3',
      desc: '',
      args: [],
    );
  }

  /// `+50% this month`
  String get growth3 {
    return Intl.message('+50% this month', name: 'growth3', desc: '', args: []);
  }

  /// `289`
  String get jobs3 {
    return Intl.message('289', name: 'jobs3', desc: '', args: []);
  }

  /// `Job Details`
  String get jobDetails {
    return Intl.message('Job Details', name: 'jobDetails', desc: '', args: []);
  }

  /// `Get placed in front of\nverified remote\nemployers`
  String get getPlacedInFront {
    return Intl.message(
      'Get placed in front of\nverified remote\nemployers',
      name: 'getPlacedInFront',
      desc: '',
      args: [],
    );
  }

  /// `Pro candidates receive a verified badge, instant application boosts, and exclusive early access to high-budget freelance contracts 24 hours before anyone else.`
  String get proCandidatesDescription {
    return Intl.message(
      'Pro candidates receive a verified badge, instant application boosts, and exclusive early access to high-budget freelance contracts 24 hours before anyone else.',
      name: 'proCandidatesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade to Premium - $9/mo`
  String get upgradeToPremium {
    return Intl.message(
      'Upgrade to Premium - \$9/mo',
      name: 'upgradeToPremium',
      desc: '',
      args: [],
    );
  }

  /// `Compare Plans`
  String get comparePlans {
    return Intl.message(
      'Compare Plans',
      name: 'comparePlans',
      desc: '',
      args: [],
    );
  }

  /// `No spam, ever`
  String get noSpamEver {
    return Intl.message(
      'No spam, ever',
      name: 'noSpamEver',
      desc: '',
      args: [],
    );
  }

  /// `Cancel anytime`
  String get cancelAnytime {
    return Intl.message(
      'Cancel anytime',
      name: 'cancelAnytime',
      desc: '',
      args: [],
    );
  }

  /// `50,000+ active users`
  String get activeUsers {
    return Intl.message(
      '50,000+ active users',
      name: 'activeUsers',
      desc: '',
      args: [],
    );
  }

  /// `Top Hiring Companies`
  String get topHiringCompanies {
    return Intl.message(
      'Top Hiring Companies',
      name: 'topHiringCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Top employers directly searching for freelancing and permanent remote talent.`
  String get topEmployersDescription {
    return Intl.message(
      'Top employers directly searching for freelancing and permanent remote talent.',
      name: 'topEmployersDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tech Company`
  String get companyName1 {
    return Intl.message(
      'Tech Company',
      name: 'companyName1',
      desc: '',
      args: [],
    );
  }

  /// `Tech Company`
  String get companyName2 {
    return Intl.message(
      'Tech Company',
      name: 'companyName2',
      desc: '',
      args: [],
    );
  }

  /// `Browse All Companies →`
  String get browseAllCompanies {
    return Intl.message(
      'Browse All Companies →',
      name: 'browseAllCompanies',
      desc: '',
      args: [],
    );
  }

  /// `Jobs open`
  String get jobsOpen {
    return Intl.message('Jobs open', name: 'jobsOpen', desc: '', args: []);
  }

  /// `Employees`
  String get employees {
    return Intl.message('Employees', name: 'employees', desc: '', args: []);
  }

  /// `jobs`
  String get jobs {
    return Intl.message('jobs', name: 'jobs', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
