import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployerInfoCard extends StatelessWidget {
  const EmployerInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF00335E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: Center(
            child: Text(
              'Tech Mastery',
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tech Company',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF7C3AED),
                ),
              ),
              SizedBox(height: 8.h),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'Software & SaaS',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color(0xFF52525B),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    width: 1.w,
                    height: 12.h,
                    color: const Color(0xFFD4D4D8),
                  ),
                  Text(
                    '11–50 employees',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color(0xFF52525B),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    width: 1.w,
                    height: 12.h,
                    color: const Color(0xFFD4D4D8),
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.sp,
                    color: const Color(0xFF52525B),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    'Austin, Texas',
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color(0xFF52525B),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
