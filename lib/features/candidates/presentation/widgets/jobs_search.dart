import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class JobsSearch extends StatelessWidget {
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const JobsSearch({
    super.key,
    this.hintText,
    this.padding,
    this.prefixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            padding ?? EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray200),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary500),
          borderRadius: BorderRadius.circular(12),
        ),
        hintStyle: Theme.of(context).textTheme.bodySmall,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
