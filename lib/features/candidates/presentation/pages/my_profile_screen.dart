import 'dart:ui';

import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_text_form_fild.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final bioController = TextEditingController();

  final availableFromController = TextEditingController();
  final jobTitleController = TextEditingController();
  final experienceController = TextEditingController();
  final educationController = TextEditingController();
  final industryController = TextEditingController();
  final summaryController = TextEditingController();
  final workExperienceController = TextEditingController();

  bool isOpenToWork = true;
  String selectedEmploymentType = 'Full-time';

  final List<String> skills = [
    'UI Design',
    'Ux Design',
    'Figma',
    'Design Systems',
    'Wireframing',
  ];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    addressController.dispose();
    bioController.dispose();
    availableFromController.dispose();
    jobTitleController.dispose();
    experienceController.dispose();
    educationController.dispose();
    industryController.dispose();
    summaryController.dispose();
    workExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            AppSpacing.vertical12,
            Text(
              'Manage your account, preferences and privacy  ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AppSpacing.vertical20,

            // Section 1: Personal Information
            _buildCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(
                            'asset/images/profile_image.png',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 90,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(45),
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.vertical20,

                  Text(
                    'Personal information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.vertical20,

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: firstNameController,
                          labelText: 'First Name*',
                          hintText: 'Input',
                        ),
                      ),
                      AppSpacing.horizontal12,
                      Expanded(
                        child: CustomTextFormField(
                          controller: lastNameController,
                          labelText: 'Last Name*',
                          hintText: 'Input',
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: emailController,
                    labelText: 'Email*',
                    hintText: 'Input',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: phoneController,
                    labelText: 'Phone number*',
                    hintText: 'Input',
                    keyboardType: TextInputType.phone,
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: countryController,
                    labelText: 'Country*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: addressController,
                    labelText: 'Address*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        controller: bioController,
                        labelText: 'Bio*',
                        hintText: 'write your description company',
                        maxLines: 3,
                        maxLength: 512,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '256/512',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neutral400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical20,

                  _buildSaveButton('Save Changes'),
                ],
              ),
            ),
            AppSpacing.vertical20,

            // Section 2: Availability
            _buildCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Availability',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.vertical12,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Open to work',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(fontSize: 14),
                      ),
                      // ✅ التحديث الجديد لـ Switch بديل activeColor
                      Switch(
                        value: isOpenToWork,
                        activeTrackColor: AppColors.primary500,
                        thumbColor: WidgetStateProperty.all(Colors.white),
                        onChanged: (val) {
                          setState(() {
                            isOpenToWork = val;
                          });
                        },
                      ),
                    ],
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: availableFromController,
                    labelText: 'Available from*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  DropdownMenu<String>(
                    initialSelection: selectedEmploymentType,
                    width: double.infinity, // ليأخذ العرض الكامل
                    label: Text(
                      'Preferred employment type*',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.gray300,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.primary500,
                          width: 1,
                        ),
                      ),
                    ),
                    dropdownMenuEntries:
                        ['Full-time', 'Part-time', 'Contract', 'Remote']
                            .map(
                              (type) => DropdownMenuEntry<String>(
                                value: type,
                                label: type,
                              ),
                            )
                            .toList(),
                    onSelected: (val) {
                      if (val != null) {
                        setState(() {
                          selectedEmploymentType = val;
                        });
                      }
                    },
                  ),
                  AppSpacing.vertical20,

                  _buildSaveButton('Save Changes'),
                ],
              ),
            ),
            AppSpacing.vertical20,

            // Section 3: Professional information
            _buildCardContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Professional information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.vertical20,

                  CustomTextFormField(
                    controller: jobTitleController,
                    labelText: 'Job title*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: experienceController,
                    labelText: 'Years of experience*',
                    hintText: 'Input',
                    keyboardType: TextInputType.number,
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: educationController,
                    labelText: 'Education*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  CustomTextFormField(
                    controller: industryController,
                    labelText: 'Industry*',
                    hintText: 'Input',
                  ),
                  AppSpacing.vertical12,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        controller: summaryController,
                        labelText: 'Summary*',
                        hintText: 'write your description company',
                        maxLines: 3,
                        maxLength: 512,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '256/512',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neutral400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical12,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextFormField(
                        controller: workExperienceController,
                        labelText: 'Work Experience*',
                        hintText: 'write your description company',
                        maxLines: 3,
                        maxLength: 512,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '256/512',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neutral400,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical20,

                  Text(
                    'Skills*',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.neutral700,
                    ),
                  ),
                  AppSpacing.vertical8,
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...skills.map((skill) => _buildSkillChip(skill)),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(Icons.add, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                  // أضف هذه الجزئية داخل الـ Column في أسفل الشاشة أو داخل _buildCardContainer جديد
                  _buildCardContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Certifications Title
                        Text(
                          'Certifications*',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.neutral700,
                              ),
                        ),
                        AppSpacing.vertical8,

                        // 2. Drag & Drop File Upload Area (Dashed Border)
                        CustomPaint(
                          painter: DashedRectPainter(
                            color: AppColors.gray300,
                            strokeWidth: 1.2,
                            gap: 5.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Upload Icon Circle
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary50,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.upload_file_outlined,
                                    color: AppColors.primary500,
                                    size: 24,
                                  ),
                                ),
                                AppSpacing.vertical12,
                                Text(
                                  'Drag & drop files here or click to browse',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.neutral800,
                                        fontSize: 13,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Supports: PDF, JPG, PNG',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: AppColors.neutral500,
                                        fontSize: 11,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSpacing.vertical20,

                        // 3. Resume Section Title
                        Text(
                          'Resume*',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.neutral700,
                              ),
                        ),
                        AppSpacing.vertical8,

                        // 4. Resume File Chip & Add Button
                        Row(
                          children: [
                            // File Chip
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary50,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.picture_as_pdf_outlined,
                                    color: AppColors.error500,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'My Resume.Pdf',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: AppColors.neutral800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.close,
                                      size: 14,
                                      color: AppColors.neutral500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSpacing.horizontal8,

                            // Add Resume Button
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: AppColors.primary500,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.vertical24,

                        // 5. Save Changes Button
                        _buildSaveButton('Save Changes'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppSpacing.vertical20,
            AppFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutral200),
      ),
      child: child,
    );
  }

  Widget _buildSaveButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary500,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.neutral700, fontSize: 12),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.close, size: 14, color: AppColors.neutral500),
        ],
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(8),
        ),
      );

    final Path dashedPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
