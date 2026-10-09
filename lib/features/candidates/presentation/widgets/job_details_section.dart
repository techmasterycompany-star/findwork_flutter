import 'package:flutter/material.dart';

class JobDetailsSection extends StatelessWidget {
  final String title;
  final Widget child;

  const JobDetailsSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),

        SizedBox(height: 8),

        DefaultTextStyle(
          style: TextStyle(
            fontSize: 11,
            height: 1.45,
            color: const Color(0xFF505050),
          ),
          child: child,
        ),
      ],
    );
  }
}
