import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/footer_link_group.dart';
import 'widgets/footer_social_icon_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  static const List<String> _candidateLinks = [
    'Browse Jobs',
    'Candidate Dashboard',
    'Saved Jobs',
    'Job Alerts',
    'Create Account',
  ];

  static const List<String> _employerLinks = [
    'Post a Job',
    'Employer Dashboard',
    'Browse Candidates',
    'Pricing Plans',
    'Recruitment Solutions',
  ];

  static const List<String> _resourceLinks = [
    'Blog & Articles',
    'Career Advice',
    'Help Center',
    'Terms of Service',
    'Privacy Policy',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary950,
      padding: EdgeInsets.fromLTRB(20.w, 36.h, 20.w, 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/footer_icons/logo_footer.png',
            height: 42.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16.h),

          Text(
            'Job4U is a smart job search and recruitment platform connecting top talent with leading companies worldwide.',
            style: AppTypography.smallText.copyWith(
              color: AppColors.white,
              height: 1.6,
            ),
          ),
          SizedBox(height: 20.h),

          Row(
            children: [
              FooterSocialIconButton(
                svgAsset: 'assets/images/footer_icons/facebook_icon.svg',
                onTap: () {},
              ),
              SizedBox(width: 10.w),
              FooterSocialIconButton(
                svgAsset: 'assets/images/footer_icons/twitter_icon.svg',
                onTap: () {},
              ),
              SizedBox(width: 10.w),
              FooterSocialIconButton(
                svgAsset: 'assets/images/footer_icons/linkedin_icon.svg',
                onTap: () {},
              ),
              SizedBox(width: 10.w),
              FooterSocialIconButton(
                svgAsset: 'assets/images/footer_icons/github.svg',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 32.h),

          const Divider(color: AppColors.neutral800, height: 1),
          SizedBox(height: 28.h),

          const FooterLinkGroup(
            title: 'For Candidates',
            links: _candidateLinks,
          ),
          SizedBox(height: 24.h),

          const FooterLinkGroup(
            title: 'For Employers',
            links: _employerLinks,
          ),
          SizedBox(height: 24.h),

          const FooterLinkGroup(
            title: 'Resources',
            links: _resourceLinks,
          ),
          SizedBox(height: 32.h),

          const Divider(color: AppColors.primary600, height: 1),
          SizedBox(height: 20.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '© 2026 Job4U. All rights reserved.',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ),
              Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.primary600,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary600.withValues(alpha: 0.3),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
