import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyInfoForm extends StatelessWidget {
  const CompanyInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company information',
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16.h),
        _buildTextField('Company Name *', 'Enter company name'),
        SizedBox(height: 16.h),
        _buildTextField('Website *', 'e.g. https://example.com'),
        SizedBox(height: 16.h),
        _buildTextField('Company description *', 'Enter company description', maxLines: 4),
        SizedBox(height: 16.h),
        _buildTextField('Industry *', 'e.g. Technology, Healthcare'),
        SizedBox(height: 16.h),
        _buildTextField('Company size *', 'e.g. 50-100 employees'),
        SizedBox(height: 16.h),
        _buildTextField('Founded year *', 'e.g. 2020', trailingIcon: Icons.calendar_today),
        SizedBox(height: 16.h),
        _buildTextField('Company location *', 'e.g. New York, USA'),
        SizedBox(height: 16.h),
        _buildTextField('Company benefits *', 'e.g. https://example.com', maxLines: 4),
        SizedBox(height: 16.h),
        _buildTextField('Company culture *', 'e.g. https://example.com', maxLines: 4),
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

  Widget _buildTextField(String label, String hint, {int maxLines = 1, IconData? trailingIcon}) {
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
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontSize: 14.sp,
              color: const Color(0xFFA1A1AA),
            ),
            suffixIcon: trailingIcon != null
                ? Icon(trailingIcon, color: const Color(0xFFA1A1AA), size: 20.sp)
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: maxLines > 1 ? 16.h : 0),
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
      ],
    );
  }
}
