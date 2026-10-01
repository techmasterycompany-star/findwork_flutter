import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicantActionButtons extends StatelessWidget {
  final VoidCallback onShortlist;
  final VoidCallback onMessage;
  final VoidCallback onReject;

  const ApplicantActionButtons({
    Key? key,
    required this.onShortlist,
    required this.onMessage,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onShortlist,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.primary600,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Shortlist',
                style: AppTypography.smallText.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
            onTap: onMessage,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary600),
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Message',
                style: AppTypography.smallText.copyWith(
                  color: AppColors.primary600,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: onReject,
          child: Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.error400),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.close, color: AppColors.error500, size: 20.sp),
          ),
        ),
      ],
    );
  }
}
