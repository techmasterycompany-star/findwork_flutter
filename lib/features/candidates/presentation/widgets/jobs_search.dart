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
        isDense: true,
        contentPadding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        enabledBorder: InputBorder.none, // إزالة الحواف لتعتمد على CustomCard
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.grey),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 32, minHeight: 0),
      ),
    );
  }
}
