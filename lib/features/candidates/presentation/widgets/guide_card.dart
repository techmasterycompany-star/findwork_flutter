import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class GuideCard extends StatelessWidget {
  final String category;
  final String readTime;
  final String title;
  final VoidCallback? onPressed;

  const GuideCard({
    super.key,
    required this.category,
    required this.readTime,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: AppColors.primary700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Text(
                readTime,
                style: TextStyle(color: AppColors.gray400, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              S.of(context).readArticle,
              style: TextStyle(
                color: AppColors.primary700,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
