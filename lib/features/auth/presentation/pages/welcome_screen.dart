import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:findwork_flutter/features/auth/data/models/user.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/auth_form_fields.dart';
import 'package:findwork_flutter/features/auth/presentation/widgets/user_type_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  UserType _selectedType = UserType.candidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              AppSpacing.vertical48,
              _buildHeader(),
              AppSpacing.vertical48,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildIllustration(),
                      AppSpacing.vertical32,
                      _buildUserTypeSelector(),
                      AppSpacing.vertical24,
                      _buildContinueButton(),
                      AppSpacing.vertical16,
                      _buildSignUpPrompt(),
                      AppSpacing.vertical24,
                    ],
                  ),
                ),
              ),
              AppSpacing.vertical24,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logo/logo_Job4u.png',
              width: 48.w,
              height: 48.h,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.work_outline,
                size: 48.sp,
                color: AppColors.primary600,
              ),
            ),
          ),
        ),
        AppSpacing.vertical24,
        Text(
          'Welcome to Job4U',
          style: AppTypography.h1.copyWith(
            fontSize: 32.sp,
            color: AppColors.neutral900,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.vertical12,
        Text(
          'Find your dream job or hire top talent.\nChoose how you want to continue.',
          style: AppTypography.body.copyWith(
            color: AppColors.neutral600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      width: double.infinity,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusXLarge),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary50,
            AppColors.primary100,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40.w,
            top: -40.h,
            child: Container(
              width: 200.w,
              height: 200.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary200.withValues(alpha: 0.3),
              ),
            ),
          ),
          Positioned(
            left: -60.w,
            bottom: -60.h,
            child: Container(
              width: 240.w,
              height: 240.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary100.withValues(alpha: 0.3),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              'asset/images/office.png',
              width: 220.w,
              height: 220.h,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.business_outlined,
                size: 120.sp,
                color: AppColors.primary200,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserTypeSelector() {
    return UserTypeSelector(
      selectedType: _selectedType,
      onChanged: (type) {
        setState(() {
          _selectedType = type;
        });
      },
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          debugPrint('Continue pressed, userType: ${_selectedType.name}');
          if (_selectedType == UserType.employer) {
            context.go('/HomepageEmployer');
          } else {
            context.go('/CandidateProfile');
          }
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
          'Continue',
          style: AppTypography.body.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return AuthRichText(
      text: 'Don\'t have an account?',
      actionText: 'Sign Up',
      onTap: () => context.go('/register/user-type'),
    );
  }
}