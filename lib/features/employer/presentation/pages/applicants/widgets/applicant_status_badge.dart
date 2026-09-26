import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantStatusBadge extends StatelessWidget {
  final String status;

  const ApplicantStatusBadge({Key? key, required this.status}) : super(key: key);

  Color get _bgColor {
    switch (status.toLowerCase()) {
      case 'new':
        return AppColors.primary100;
      case 'shortlisted':
        return AppColors.success100;
      case 'interview':
        return const Color(0xFFDCEFFF);
      case 'rejected':
        return AppColors.error100;
      case 'hired':
        return AppColors.success200;
      default:
        return AppColors.neutral100;
    }
  }

  Color get _textColor {
    switch (status.toLowerCase()) {
      case 'new':
        return AppColors.primary700;
      case 'shortlisted':
        return AppColors.success700;
      case 'interview':
        return const Color(0xFF1D6FA4);
      case 'rejected':
        return AppColors.error700;
      case 'hired':
        return AppColors.success800;
      default:
        return AppColors.neutral600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status,
        style: AppTypography.caption.copyWith(
          color: _textColor,
          fontWeight: FontWeight.w600,
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
