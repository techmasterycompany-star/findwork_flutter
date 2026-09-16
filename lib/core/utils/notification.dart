import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../../features/admin/presentation/widgets/screen_headline.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = <String>[];
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadLine(message: 'Notification'),
              AppSpacing.vertical24,
              if (notifications.isEmpty)
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/rafiki.png', width: 300),

                      Text('Nothing right now. Check back later!', style: textTheme.displayLarge,),
                    ],
                  ),
                )
              else
                ...notifications.map(
                  (notification) => ListTile(title: Text(notification)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
