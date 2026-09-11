import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../widgets/screen_headline.dart';
import '../widgets/summary_card.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: AppSpacing.sectionGap),
          padding: EdgeInsets.all(AppSpacing.sectionInternalPadding),
          child: Column(
            children: [
              HeadLine(message: 'User Management'),

              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.cardGapSmall,
                  crossAxisSpacing: AppSpacing.cardGapSmall,
                ),
                itemBuilder: (context, index) => SummaryCard(title: 'Activation Company', number: '30', subTitle: 'review account',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


