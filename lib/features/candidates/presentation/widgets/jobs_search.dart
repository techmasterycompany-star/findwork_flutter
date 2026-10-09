import 'package:flutter/material.dart';

class JobsSearch extends StatelessWidget {
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const JobsSearch({
    super.key,
    this.hintText,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 32, minHeight: 0),
      ),
    );
  }
}
