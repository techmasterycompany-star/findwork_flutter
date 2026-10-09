import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? maxLength;
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines ?? 1,
      maxLength: maxLength ?? 250,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        hintText: hintText,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.gray300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary500, width: 1),
        ),
      ),
    );
  }
}
