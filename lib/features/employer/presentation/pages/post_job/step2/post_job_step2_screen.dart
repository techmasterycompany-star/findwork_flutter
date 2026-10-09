import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'widgets/post_job_skills_input.dart';
import 'widgets/post_job_step2_bottom_bar.dart';
import 'widgets/post_job_stepper.dart';
import 'widgets/post_job_text_area.dart';

class PostJobStep2Screen extends StatefulWidget {
  const PostJobStep2Screen({super.key});

  @override
  State<PostJobStep2Screen> createState() => PostJobStep2ScreenState();
}

class PostJobStep2ScreenState extends State<PostJobStep2Screen> {
  final TextEditingController descriptionController = TextEditingController(
    text:
        'We are looking for a Senior Product Designer to lead user experience design for our SaaS workspace product. You will work closely with engineering, product management, and customers to identify core problems and build elegant solutions.',
  );

  final TextEditingController requirementsController = TextEditingController(
    text:
        '- 4+ years of professional UX/UI design experience with software products\n- Expert knowledge of Figma, component libraries, and visual design standards\n- Experience collaborating directly with engineers on React/JSX codebases\n- Strong portfolio demonstrating end-to-end design thinking',
  );

  final TextEditingController responsibilitiesController =
      TextEditingController(
    text:
        '- Design wireframes, user flows, and high-fidelity mockups using established design systems\n- Participate in user research and translate qualitative insights into functional design specs\n- Champion accessibility, usability, and design precision across Web and Mobile targets',
  );

  final TextEditingController skillInputController = TextEditingController();

  final List<String> skills = [
    'Figma',
    'SaaS Product Design',
    'User Research',
    'React UX',
  ];

  @override
  void dispose() {
    descriptionController.dispose();
    requirementsController.dispose();
    responsibilitiesController.dispose();
    skillInputController.dispose();
    super.dispose();
  }

  void _addSkill(String skill) {
    if (!skills.contains(skill) && skills.length < 15) {
      setState(() {
        skills.add(skill);
      });
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.neutral50,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.neutral700,
            size: 22.sp,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        titleSpacing: 0,
        title: Image.asset(
          'assets/images/logo.png',
          height: 32.h,
          errorBuilder: (_, e, stack) => Text(
            'Job4U',
            style: AppTypography.cardTitle.copyWith(
              color: AppColors.primary600,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            color: AppColors.white,
            child: const PostJobStepper(currentStep: 2),
          ),
          const Divider(color: AppColors.neutral200, height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 2: Job Description & Skills',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.neutral900,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Detail the duties, required qualifications, and daily responsibilities for this role.',
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.neutral500,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PostJobTextArea(
                    label: 'Job Description',
                    hintText: 'Describe the overall mission and impact of this job...',
                    controller: descriptionController,
                    helperText:
                        'Describe the overall mission and impact of this job. (Recommended: 300-500 words)',
                    countText: '2996/12',
                    minLines: 5,
                    maxLines: 7,
                    onChanged: (val) => setState(() {}),
                  ),
                  SizedBox(height: 20.h),
                  PostJobTextArea(
                    label: 'Requirements & Qualifications',
                    hintText: 'List required qualifications...',
                    controller: requirementsController,
                    minLines: 5,
                    maxLines: 8,
                  ),
                  SizedBox(height: 20.h),
                  PostJobTextArea(
                    label: 'Key Responsibilities',
                    hintText: 'List daily responsibilities...',
                    controller: responsibilitiesController,
                    minLines: 5,
                    maxLines: 8,
                  ),
                  SizedBox(height: 20.h),
                  PostJobSkillsInput(
                    controller: skillInputController,
                    skills: skills,
                    onAddSkill: _addSkill,
                    onRemoveSkill: _removeSkill,
                    helperText:
                        'Add up to 15 keywords or full combinations of Tag and Skills',
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          PostJobStep2BottomBar(
            onBack: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/PostJobStep1');
              }
            },
            onContinue: () {
              context.push('/PostJobStep3');
            },
          ),
        ],
      ),
    );
  }
}
