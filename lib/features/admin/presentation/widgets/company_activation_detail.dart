import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/company_activation.dart';

class CompanyActivationDetail extends StatelessWidget {
  final CompanyActivation company;
  final VoidCallback? onActivate;
  final VoidCallback? onReject;

  const CompanyActivationDetail({
    super.key,
    required this.company,
    this.onActivate,
    this.onReject,
  });

  static void show(
    BuildContext context, {
    required CompanyActivation company,
    VoidCallback? onActivate,
    VoidCallback? onReject,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusXLarge)),
      ),
      builder: (_) => CompanyActivationDetail(
        company: company,
        onActivate: onActivate,
        onReject: onReject,
      ),
    );
  }

  Color _statusBgColor(ColorScheme colorTheme) {
    switch (company.status) {
      case 'Active':
        return AppColors.success50;
      case 'Rejected':
        return AppColors.error50;
      default:
        return AppColors.warning50;
    }
  }

  Color _statusTextColor(ColorScheme colorTheme) {
    switch (company.status) {
      case 'Active':
        return AppColors.success600;
      case 'Rejected':
        return AppColors.error600;
      default:
        return AppColors.warning600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorTheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.radiusXLarge)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorTheme.onSurface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
                  ),
                ),
              ),
              AppSpacing.vertical24,
              Row(
                children: [
                  Text(
                    'Company Details',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              AppSpacing.vertical24,
              _buildCompanyHeader(colorTheme, textTheme),
              AppSpacing.vertical24,
              Text(
                company.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
              AppSpacing.vertical32,
              _buildInfoSection(textTheme, colorTheme),
              AppSpacing.vertical32,
              _buildDocumentsSection(textTheme, colorTheme),
              AppSpacing.vertical32,
              _buildActionButtons(context, colorTheme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompanyHeader(ColorScheme colorTheme, TextTheme textTheme) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: colorTheme.primary,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          ),
          child: Icon(Icons.business, color: colorTheme.onPrimary, size: 28),
        ),
        AppSpacing.horizontal24,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company.name,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.vertical8,
              Text(
                company.email,
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                company.phone,
                style: textTheme.bodySmall?.copyWith(
                  color: colorTheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.iconTextGap,
            vertical: AppSpacing.iconTextGap,
          ),
          decoration: BoxDecoration(
            color: _statusBgColor(colorTheme),
            borderRadius: BorderRadius.circular(AppSpacing.radiusTiny),
          ),
          child: Text(
            company.status,
            style: textTheme.bodySmall?.copyWith(
              color: _statusTextColor(colorTheme),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(TextTheme textTheme, ColorScheme colorTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorTheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.business_center, size: 18, color: colorTheme.primary),
              AppSpacing.horizontal8,
              Text(
                'Company Information',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacing.vertical24,
          _buildInfoRow('Industry', company.industry, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Company Size', company.companySize, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Website', company.website, textTheme, colorTheme),
          AppSpacing.vertical12,
          _buildInfoRow('Location', company.location, textTheme, colorTheme),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, TextTheme textTheme, ColorScheme colorTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: colorTheme.onSurface,
          ),
        ),
        AppSpacing.vertical8,
        Text(value, style: textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildDocumentsSection(TextTheme textTheme, ColorScheme colorTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sectionInternalPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorTheme.onSurface,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description, size: 18, color: colorTheme.primary),
              AppSpacing.horizontal8,
              Text(
                'Verification Documents',
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AppSpacing.vertical24,
          ...company.documents.map(
            (doc) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.iconTextGap),
              child: Row(
                children: [
                  Icon(
                    Icons.insert_drive_file,
                    size: 18,
                    color: colorTheme.onSurface,
                  ),
                  AppSpacing.horizontal8,
                  Expanded(
                    child: Text(doc, style: textTheme.bodyMedium),
                  ),
                  Icon(Icons.download, size: 18, color: colorTheme.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ColorScheme colorTheme) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onActivate?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success600,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.titleToDescription,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
            ),
            child: const Text('Activate'),
          ),
        ),
        AppSpacing.vertical12,
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              onReject?.call();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error600,
              side: const BorderSide(color: AppColors.error600),
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.titleToDescription,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
            ),
            child: const Text('Reject'),
          ),
        ),
      ],
    );
  }
}
