import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:findwork_flutter/core/constants/app_colors.dart';

class PremiumBanner extends StatelessWidget {
  final VoidCallback? onUpgrade;
  final VoidCallback? onComparePlans;

  const PremiumBanner({super.key, this.onUpgrade, this.onComparePlans});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary900,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).getPlacedInFront,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          AppSpacing.vertical12,

          Text(
            S.of(context).proCandidatesDescription,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          AppSpacing.vertical12,

          Row(
            children: [
              Expanded(
                child: ActiveJobsBadge(
                  height: 48,
                  circular: 8,
                  onPressed: onUpgrade,
                  backGround: AppColors.primary500,
                  text: S.of(context).upgradeToPremium,
                  textStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ActiveJobsBadge(
                  height: 43,
                  circular: 8,
                  border: Border.all(color: AppColors.white, width: 1),
                  backGround: AppColors.primary900,
                  onPressed: onComparePlans,
                  text: S.of(context).comparePlans,
                  textStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          AppSpacing.vertical12,

          _BenefitItem(text: S.of(context).noSpamEver),
          _BenefitItem(text: S.of(context).cancelAnytime),
          _BenefitItem(text: S.of(context).activeUsers),
        ],
      ),
    );
  }
}

class _BenefitItem extends StatelessWidget {
  final String text;

  const _BenefitItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.success500,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
