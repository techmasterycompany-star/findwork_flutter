import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';

enum JobStatus { applied, closed }

class IsClosedCard extends StatelessWidget {
  final String title;
  final String company;
  final String imagePath;
  final String location;
  final String salary;
  final String postedTime;
  final String? jobDetails;

  final VoidCallback? onDetails;
  final VoidCallback? onBookmark;
  final String? jobDescription;
  final String typeJob;
  final String jobplace;
  final bool boolBorder;
  final JobStatus status;

  const IsClosedCard({
    super.key,
    required this.title,
    required this.company,
    required this.imagePath,
    required this.location,
    required this.salary,
    required this.postedTime,
    this.jobDetails,
    this.onDetails,
    this.onBookmark,
    this.jobDescription,
    required this.typeJob,
    required this.jobplace,
    this.boolBorder = true,
    this.status = JobStatus.applied,
  });

  @override
  Widget build(BuildContext context) {
    final isClosed = status == JobStatus.closed;

    // تحديد ألوان الكارت بناءً على ثوابت AppColors
    final cardBgColor = isClosed ? AppColors.error50 : AppColors.success50;
    final statusColor = isClosed ? AppColors.error600 : AppColors.success600;
    final statusBgColor = isClosed ? AppColors.error100 : AppColors.success100;
    final borderColor = isClosed ? AppColors.error200 : AppColors.success200;

    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      backgroundColor: cardBgColor,
      border: boolBorder ? BorderSide(color: borderColor) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Title & Status Badge)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isClosed
                          ? Icons.cancel_outlined
                          : Icons.check_circle_outline,
                      size: 16,
                      color: statusColor,
                    ),
                    AppSpacing.horizontal8,
                    Text(
                      isClosed ? 'Closed' : 'Applied',
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          AppSpacing.vertical8,

          // 2. Company Info & Badges
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.gray200),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.business, color: AppColors.gray400),
                ),
              ),
              AppSpacing.horizontal12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      ActiveJobsBadge(
                        circular: AppSpacing.radiusTiny,
                        text: typeJob,
                        backGround: AppColors.primary50,
                        textStyle: const TextStyle(
                          color: AppColors.primary600,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AppSpacing.horizontal8,
                      ActiveJobsBadge(
                        circular: AppSpacing.radiusTiny,
                        text: jobplace,
                        backGround: AppColors.success100,
                        textStyle: const TextStyle(
                          color: AppColors.success700,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // 3. Job Description
          if (jobDescription != null && jobDescription!.isNotEmpty) ...[
            AppSpacing.vertical12,
            Text(
              jobDescription!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],

          AppSpacing.vertical12,

          // 4. Location & Salary
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: AppColors.primary500,
              ),
              const SizedBox(width: 4),
              Text(location, style: Theme.of(context).textTheme.bodySmall),
              AppSpacing.horizontal24,
              const Icon(
                Icons.monetization_on_outlined,
                size: 16,
                color: AppColors.primary500,
              ),
              const SizedBox(width: 4),
              Text(salary, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),

          AppSpacing.vertical12,

          // 5. Footer Actions / Closed Message
          if (!isClosed)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onDetails,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary600,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMedium,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      jobDetails ?? 'View Application',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                AppSpacing.horizontal12,
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.primary600),
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMedium,
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onBookmark,
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: AppColors.primary600,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.error100,
                border: Border.all(color: AppColors.error300),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 18,
                    color: AppColors.error600,
                  ),
                  AppSpacing.horizontal8,
                  Expanded(
                    child: Text(
                      'Job no longer accepting applications',
                      style: TextStyle(
                        color: AppColors.error600,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
