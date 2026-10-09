import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';

class HowItWorksStep extends StatelessWidget {
  final String step;
  final String title;
  final String description;
  final IconData icon;
  final bool isActive;
  final VoidCallback? onTap;

  const HowItWorksStep({
    super.key,
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary600 : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary600, width: 1),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.primary600.withValues(alpha: 0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.white : AppColors.primary600,
              size: 24,
            ),
          ),

          const SizedBox(width: 14),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActiveJobsBadge(
                  text: step,
                  backGround: isActive ? AppColors.primary600 : Colors.white,
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : AppColors.primary600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
