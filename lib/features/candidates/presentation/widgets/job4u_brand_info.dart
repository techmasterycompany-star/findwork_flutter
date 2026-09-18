import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Job4UBrandInfo extends StatelessWidget {
  final String logoPath;
  final String description;

  final VoidCallback? onFacebook;
  final VoidCallback? onTwitter;
  final VoidCallback? onLinkedIn;
  final VoidCallback? onGithub;

  const Job4UBrandInfo({
    super.key,
    required this.logoPath,
    required this.description,
    this.onFacebook,
    this.onTwitter,
    this.onLinkedIn,
    this.onGithub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(logoPath, width: 70, height: 35, fit: BoxFit.contain),

        const SizedBox(height: 8),

        Text(
          description,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 14),

        Row(
          children: [
            _SocialButton(
              icon: FontAwesomeIcons.facebookF,
              onPressed: onFacebook,
            ),

            const SizedBox(width: 10),

            _SocialButton(icon: FontAwesomeIcons.twitter, onPressed: onTwitter),

            const SizedBox(width: 10),

            _SocialButton(
              icon: FontAwesomeIcons.linkedinIn,
              onPressed: onLinkedIn,
            ),

            const SizedBox(width: 10),

            _SocialButton(icon: FontAwesomeIcons.github, onPressed: onGithub),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final FaIconData icon;
  final VoidCallback? onPressed;

  const _SocialButton({required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        icon: FaIcon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
