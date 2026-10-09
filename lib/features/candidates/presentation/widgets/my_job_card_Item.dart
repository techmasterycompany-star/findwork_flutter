import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class MyJobCardItem extends StatelessWidget {
  final String title;
  final String company;
  final String logoAssetPath;
  final String statusText;
  final String workType;
  final String locationType;
  final int applicationsCount;
  final VoidCallback onViewApplications;
  final VoidCallback onViewJob;
  final VoidCallback? onOptionsTap;

  const MyJobCardItem({
    super.key,
    this.title = 'UI/UX Designer',
    this.company = 'Tech Company',
    this.logoAssetPath = 'asset/images/image1.png',
    this.statusText = 'Active',
    this.workType = 'Full-Time',
    this.locationType = 'Hybrid',
    this.applicationsCount = 24,
    required this.onViewApplications,
    required this.onViewJob,
    this.onOptionsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neutral200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Header Row (Logo, Company Details, Menu Button)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Container
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.neutral50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.neutral200),
                ),
                child: Image.asset(
                  logoAssetPath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('asset/images/image1.png'),
                ),
              ),
              AppSpacing.horizontal12,

              // Title and Company Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      company,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.neutral500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Options Menu Icon (More vert)
              InkWell(
                onTap: onOptionsTap,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.primary50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColors.primary500,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.vertical12,

          // 2. Tags Row (Active, Full-Time, Hybrid)
          Row(
            children: [
              // Active Tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.success50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: AppColors.success600,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Full-Time Tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.primary300),
                ),
                child: Text(
                  workType,
                  style: const TextStyle(
                    color: AppColors.primary600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Hybrid Tag
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.warning300),
                ),
                child: Text(
                  locationType,
                  style: const TextStyle(
                    color: AppColors.warning600,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.vertical12,

          // 3. Applications Count Row
          Row(
            children: [
              const Icon(
                Icons.people_outline,
                size: 16,
                color: AppColors.primary500,
              ),
              const SizedBox(width: 6),
              Text(
                '$applicationsCount applications',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          AppSpacing.vertical20,

          // 4. Action Buttons (View Applications & View Job)
          Row(
            children: [
              // Primary Button
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: onViewApplications,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'View Applications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              AppSpacing.horizontal12,

              // Outlined Button
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: onViewJob,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'View Job',
                      style: TextStyle(
                        color: AppColors.primary600,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
