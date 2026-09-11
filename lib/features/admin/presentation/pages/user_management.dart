import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Text('hello', style: textTheme.bodyLarge, textAlign: .center),
    );
  }
}
