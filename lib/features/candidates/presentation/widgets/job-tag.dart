import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class JobTag extends StatelessWidget {
  final String label;

  const JobTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.gray200),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 8.5,
          color: AppColors.gray500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
