import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/pages/candidates_price_screen.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';

class AboutHero extends StatelessWidget {
  const AboutHero({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/images/back-office.png'),
          fit: BoxFit.cover,
        ),
        // color: theme.colorScheme.primary,
        // borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActiveJobsBadge(
            onPressed: () {},
            circular: 8,
            border: Border.all(width: 1.5, color: AppColors.primary500),
            backGround: AppColors.primary50,
            text: 'Our Story',
            textStyle: TextStyle(
              color: AppColors.primary500,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          AppSpacing.vertical12,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'We Connect ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                TextSpan(
                  text: 'Talent \n',
                  style: TextStyle(
                    color: AppColors.primary500,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'With Opportunity',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),

          AppSpacing.vertical12,

          Text(
            'Job4U was built on a simple belief: the best person for'
            'any job could be anywhere in the world. We built the'
            'platform to prove it.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: .85),
            ),
          ),

          AppSpacing.vertical20,

          Row(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CandidatesPriceScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Browse Candidates',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSpacing.horizontal8,
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          weight: 5.5,
                          size: 9.5,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSpacing.horizontal12,
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.white, width: 0.7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Post a Job',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
