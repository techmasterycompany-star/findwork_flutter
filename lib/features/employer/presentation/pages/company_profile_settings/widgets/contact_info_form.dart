import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfoForm extends StatelessWidget {
  const ContactInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(child: _buildTextField('Company Email *', 'Enter company email')),
            SizedBox(width: 16.w),
            Expanded(child: _buildTextField('Phone Number *', 'e.g. +1 234...')),
          ],
        ),
        SizedBox(height: 16.h),
        RichText(
          text: TextSpan(
            text: 'Social Links',
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: GoogleFonts.inter(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        _buildSocialLinkRow(),
        SizedBox(height: 16.h),
        _buildSocialLinkRow(),
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF7C3AED)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: const Color(0xFF7C3AED), size: 18.sp),
                SizedBox(width: 8.w),
                Text(
                  'Add Link',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7C3AED),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Save Changes',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label.replaceAll(' *', ''),
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            children: [
              if (label.contains('*'))
                TextSpan(
                  text: ' *',
                  style: GoogleFonts.inter(color: Colors.red),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 48.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                color: const Color(0xFFA1A1AA),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFFE4E4E7)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(color: Color(0xFFE4E4E7)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLinkRow() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE4E4E7)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(Icons.link, color: const Color(0xFF0077B5), size: 20.sp), // Placeholder for linkedin
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'LinkedIn',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.sp),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 48.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tech Mastery',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
                prefixIcon: Icon(Icons.link, color: Colors.grey, size: 20.sp),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E7)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Color(0xFFE4E4E7)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          height: 48.h,
          width: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE4E6),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(Icons.delete_outline, color: Colors.red, size: 20.sp),
        ),
      ],
    );
  }
}
