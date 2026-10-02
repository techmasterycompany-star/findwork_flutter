import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/basic_plan_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/career_plus_plan_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/career_pro_plan_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/picing_header_widget.dart';
import 'package:flutter/material.dart';

class CandidatesPriceScreen extends StatelessWidget {
  const CandidatesPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.vertical12,
              Text('Price', style: Theme.of(context).textTheme.bodySmall),
              AppSpacing.vertical20,
              PicingHeaderWidget(),
              AppSpacing.vertical64,
              BasicPlanCard(
                onGetStarted: () {
                  // Navigate / action
                },
              ),

              const SizedBox(height: 20),

              CareerProPlanCard(
                onSelectPro: () {
                  // Navigate / payment
                },
              ),
              const SizedBox(height: 20),
              CareerPlusPlanCard(onGetStarted: () {}),
              const SizedBox(height: 20),
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
