import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopHiringCompanies extends StatelessWidget {
  final String companyName;
  final String? imagePath;
  final double rating;
  final String employees;
  final String jobsOpen;
  final VoidCallback? onTap;
  const TopHiringCompanies({
    super.key,
    required this.companyName,
    this.imagePath,
    required this.rating,
    required this.employees,
    required this.jobsOpen,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomCard(
        padding: EdgeInsets.all(12),
        backgroundColor: Theme.of(context).colorScheme.surface,
        border: BorderSide(color: AppColors.gray500, width: 1),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Logo
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Image.asset(
                    imagePath ?? 'asset/images/image-cmpony.png',
                  ),
                ),

                AppSpacing.horizontal12,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    AppSpacing.vertical12,

                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 18,
                          color: index < rating
                              ? AppColors.warning400
                              : AppColors.gray200,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            AppSpacing.vertical20,
            Row(
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

                const SizedBox(width: 6),

                Text(
                  '$employees ${S.of(context).employees}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const SizedBox(width: 24),

                SvgPicture.asset(
                  'asset/icons/job-icon.svg',
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                    AppColors.primary500,
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(width: 6),

                Text(
                  '$jobsOpen ${S.of(context).jobsOpen}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
