import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo/logo_Job4u.png',
        height: 50,
        fit: BoxFit.contain,
      ),
    );
  }
}
