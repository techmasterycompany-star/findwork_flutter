import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildSuccessAnimation(),
              AppSpacing.vertical32,
              _buildCongratsText(),
              AppSpacing.vertical16,
              _buildSubText(),
              const Spacer(),
              _buildContinueButton(context),
              AppSpacing.vertical32,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessAnimation() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 160.w,
          height: 160.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success50,
          ),
        ),
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success100,
          ),
        ),
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success600,
          ),
          child: Icon(
            Icons.check_rounded,
            size: 40.sp,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCongratsText() {
    return Column(
      children: [
        Text(
          'Congratulations!',
          style: AppTypography.h1.copyWith(
            fontSize: 32.sp,
            color: AppColors.neutral900,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.vertical8,
        Text(
          'Your account has been created successfully',
          style: AppTypography.h2.copyWith(
            fontSize: 20.sp,
            color: AppColors.neutral700,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSubText() {
    return Text(
      'Welcome to Job4U! You can now start exploring\njob opportunities or posting jobs.',
      style: AppTypography.body.copyWith(
        color: AppColors.neutral500,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          context.go('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary600,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
        ),
        child: Text(
          'Continue to Login',
          style: AppTypography.body.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}