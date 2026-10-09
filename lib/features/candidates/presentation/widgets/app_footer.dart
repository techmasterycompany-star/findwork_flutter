import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'footer_link_section.dart';
import 'job4u_brand_info.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
      color: const Color(0xFF2D115C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Job4UBrandInfo(
            logoPath: 'asset/images/logo.png',
            description: S.of(context).description,
            onFacebook: () {},
            onTwitter: () {},
            onLinkedIn: () {},
            onGithub: () {},
          ),

          const SizedBox(height: 24),

          FooterLinkSection(
            title: S.of(context).title3,
            links: [
              S.of(context).links,
              S.of(context).links2,
              S.of(context).links3,
              S.of(context).links4,
              S.of(context).links5,
            ],
          ),

          const SizedBox(height: 16),

          FooterLinkSection(
            title: S.of(context).title4,
            links: [
              S.of(context).links6,
              S.of(context).links7,
              S.of(context).links8,
              S.of(context).links9,
              S.of(context).links10,
            ],
          ),

          const SizedBox(height: 16),

          FooterLinkSection(
            title: S.of(context).title5,
            links: [
              S.of(context).links11,
              S.of(context).links12,
              S.of(context).links12,
              S.of(context).links14,
            ],
          ),

          const SizedBox(height: 18),

          Divider(color: Colors.white.withValues(alpha: 0.15)),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).Job4U,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.35),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
