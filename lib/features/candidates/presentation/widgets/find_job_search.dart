import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/jobs_search.dart';
import 'package:flutter/material.dart';
import 'package:findwork_flutter/core/constants/app_colors.dart';

class JobSearchBar extends StatelessWidget {
  final TextEditingController? jobTitleController;
  final TextEditingController? locationController;
  final VoidCallback? onSearchPressed;
  final String? titel;

  const JobSearchBar({
    super.key,
    this.jobTitleController,
    this.locationController,
    this.onSearchPressed,
    this.titel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      borderRadius: 12,
      border: BorderSide(color: AppColors.gray200),
      backgroundColor: AppColors.gray100,
      child: Row(
        children: [
          Expanded(
            child: JobsSearch(
              controller: jobTitleController,
              hintText: titel ?? 'Job title',
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 24,
            width: 1,
            color: AppColors.gray400,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          Expanded(
            child: JobsSearch(
              controller: locationController,
              hintText: 'location',
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),

          const SizedBox(width: 8),
          ActiveJobsBadge(
            circular: 8,
            backGround: AppColors.primary500,
            onPressed: onSearchPressed,
            text: 'Find Jobs',
            textStyle: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
