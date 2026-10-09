import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:findwork_flutter/core/utils/employers_utils/employer_top_bar.dart';
import 'package:findwork_flutter/core/utils/footer/footer.dart';
import 'widgets/company_info_form.dart';
import 'widgets/contact_info_form.dart';

class CompanyProfileSettingsScreen extends StatefulWidget {
  const CompanyProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<CompanyProfileSettingsScreen> createState() => _CompanyProfileSettingsScreenState();
}

class _CompanyProfileSettingsScreenState extends State<CompanyProfileSettingsScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: EmployerTopBar(
        darkmode: () {},
        languge: () {},
        notification: () {},
        menu: () {},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new, size: 16.sp, color: Colors.black),
                        SizedBox(width: 8.w),
                        Text('Back', style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.black)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Settings',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Manage your account, preferences and privacy',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: const Color(0xFF52525B),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company Profile',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: const Color(0xFF00335E),
                                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                                child: _imageFile == null
                                    ? Icon(Icons.business, color: Colors.white, size: 40.sp)
                                    : null,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SafeArea(
                                          child: Wrap(
                                            children: <Widget>[
                                              ListTile(
                                                leading: const Icon(Icons.photo_library),
                                                title: const Text('Photo Library'),
                                                onTap: () {
                                                  context.pop();
                                                  _pickImage(ImageSource.gallery);
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.photo_camera),
                                                title: const Text('Camera'),
                                                onTap: () {
                                                  context.pop();
                                                  _pickImage(ImageSource.camera);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color(0xFFE4E4E7)),
                                    ),
                                    child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        const CompanyInfoForm(),
                        SizedBox(height: 32.h),
                        const ContactInfoForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
