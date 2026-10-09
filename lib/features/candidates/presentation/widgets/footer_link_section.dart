import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FooterLinkSection extends StatelessWidget {
  final String title;
  final List<String> links;
  final ValueChanged<String>? onLinkPressed;

  const FooterLinkSection({
    super.key,
    required this.title,
    required this.links,
    this.onLinkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: InkWell(
              onTap: () => onLinkPressed?.call(link),
              child: Text(
                link,
                style: TextStyle(
                  color: AppColors.gray300,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
