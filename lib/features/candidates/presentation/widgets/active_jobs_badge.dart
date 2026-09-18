import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class ActiveJobsBadge extends StatelessWidget {
  final String? jobsCount;
  final String text;
  final VoidCallback? onPressed;
  final Color? backGround;
  final TextStyle? textStyle;
  final Border? border;
  final bool showDot;
  final double? height;
  final double? circular;
  const ActiveJobsBadge({
    super.key,
    this.jobsCount,
    required this.text,
    this.onPressed,
    this.backGround,
    this.textStyle,
    this.border,
    this.showDot = false,
    this.height,
    this.circular,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(circular ?? 20),
      child: Container(
        height: height ?? 28,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: backGround ?? AppColors.primary100,
          borderRadius: BorderRadius.circular(circular ?? 20),
          border: border,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showDot)
              Container(
                height: 7,
                width: 7,
                decoration: const BoxDecoration(
                  color: AppColors.primary600,
                  shape: BoxShape.circle,
                ),
              ),
            if (showDot) const SizedBox(width: 6),
            Text(
              jobsCount != null ? "$jobsCount $text" : text,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
