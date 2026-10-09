import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyCard extends StatelessWidget {
  final String companyName;
  final String overview;
  final double rating;

  final String? logoUrl;

  final String badge1;
  final Color badge1Color;

  final String badge2;
  final Color badge2Color;

  final String jobs;
  final String employees;
  final String salaries;

  final VoidCallback? onTap;
  final bool? companyDetails;

  const CompanyCard({
    super.key,
    required this.companyName,
    required this.overview,
    required this.rating,
    required this.badge1,
    required this.badge1Color,
    required this.badge2,
    required this.badge2Color,
    required this.jobs,
    required this.employees,
    required this.salaries,
    this.logoUrl,
    this.onTap,
    this.companyDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF123B63),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: logoUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          logoUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 21,
                            );
                          },
                        ),
                      )
                    : const Icon(Icons.business, color: Colors.white, size: 21),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary50,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            badge1,
                            style: TextStyle(
                              fontSize: 7,
                              color: AppColors.primary500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(width: 5),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success50,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            badge2,
                            style: TextStyle(
                              fontSize: 7,
                              color: AppColors.success500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: AppColors.warning500),
                  const SizedBox(width: 2),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          AppSpacing.vertical12,

          if (companyDetails == true) ...[
            Text(
              'Company Overview',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 5),
          ],

          Text(
            overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),

          AppSpacing.vertical12,

          // Stats
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'asset/icons/job-icon.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary500,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        jobs,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),

              AppSpacing.horizontal12,

              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'asset/icons/icon1.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary500,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        employees,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),

              AppSpacing.horizontal12,

              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.monetization_on_outlined,
                      size: 14,
                      color: AppColors.primary500,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        salaries,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (companyDetails == false) ...[
            AppSpacing.vertical20,
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ActiveJobsBadge(
                      circular: 4,
                      backGround: AppColors.primary500,
                      onPressed: onTap,
                      text: "Company Details",
                      textStyle: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
