import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Job4UBrandInfo extends StatelessWidget {
  final String? logoPath;
  final String? description;

  final VoidCallback? onFacebook;
  final VoidCallback? onTwitter;
  final VoidCallback? onLinkedIn;
  final VoidCallback? onGithub;

  // Social buttons style
  final Color? socialBackgroundColor;
  final Color? socialIconColor;
  final double? socialBorderRadius;

  const Job4UBrandInfo({
    super.key,
    this.logoPath,
    this.description,
    this.onFacebook,
    this.onTwitter,
    this.onLinkedIn,
    this.onGithub,

    // Optional style
    this.socialBackgroundColor,
    this.socialIconColor,
    this.socialBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        if (logoPath != null)
          Image.asset(logoPath!, width: 70, height: 35, fit: BoxFit.contain),

        // Description
        if (description != null) ...[
          const SizedBox(height: 8),

          Text(
            description!,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],

        // Space before social buttons
        const SizedBox(height: 14),

        // Social buttons
        Row(
          children: [
            _SocialButton(
              icon: FontAwesomeIcons.facebookF,
              onPressed: onFacebook,
              backgroundColor: socialBackgroundColor,
              iconColor: socialIconColor,
              borderRadius: socialBorderRadius,
            ),

            const SizedBox(width: 10),

            _SocialButton(
              icon: FontAwesomeIcons.twitter,
              onPressed: onTwitter,
              backgroundColor: socialBackgroundColor,
              iconColor: socialIconColor,
              borderRadius: socialBorderRadius,
            ),

            const SizedBox(width: 10),

            _SocialButton(
              icon: FontAwesomeIcons.linkedinIn,
              onPressed: onLinkedIn,
              backgroundColor: socialBackgroundColor,
              iconColor: socialIconColor,
              borderRadius: socialBorderRadius,
            ),

            const SizedBox(width: 10),

            _SocialButton(
              icon: FontAwesomeIcons.github,
              onPressed: onGithub,
              backgroundColor: socialBackgroundColor,
              iconColor: socialIconColor,
              borderRadius: socialBorderRadius,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final FaIconData icon;
  final VoidCallback? onPressed;

  final Color? backgroundColor;
  final Color? iconColor;
  final double? borderRadius;

  const _SocialButton({
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Colors.white.withValues(alpha: 0.10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
        ),
        icon: FaIcon(icon, size: 14, color: iconColor ?? Colors.white),
      ),
    );
  }
}
