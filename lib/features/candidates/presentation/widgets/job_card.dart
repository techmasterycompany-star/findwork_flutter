import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_card.dart';
import 'package:findwork_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String imagePath;
  final String location;
  final String salary;
  final String postedTime;

  final VoidCallback? onDetails;
  final VoidCallback? onBookmark;
  final String jobDescription;
  final String typeJob;
  final String jobplace;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.imagePath,
    required this.location,
    required this.salary,
    required this.postedTime,
    this.onDetails,
    this.onBookmark,
    required this.jobDescription,
    required this.typeJob,
    required this.jobplace,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      border: BorderSide(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Text(
                postedTime,
                style: TextStyle(
                  color: AppColors.gray500,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),

              const SizedBox(width: 10),

              Text(company, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              ActiveJobsBadge(
                circular: 4,
                text: typeJob,
                backGround: AppColors.primary50,
                textStyle: TextStyle(
                  color: AppColors.primary500,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(width: 8),

              ActiveJobsBadge(
                circular: 4,
                text: jobplace,
                backGround: AppColors.success50,
                textStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(jobDescription),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(child: Text("📍 $location")),
              Expanded(child: Text("💰 $salary")),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: ActiveJobsBadge(
                  height: 40,
                  circular: 12,
                  text: S.of(context).jobDetails,
                  onPressed: onDetails,
                  backGround: AppColors.primary700,
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              IconButton(
                onPressed: onBookmark,
                icon: SvgPicture.asset(
                  'asset/icons/detsils.svg',
                  width: 40,
                  height: 40,
                  // colorFilter: ColorFilter.mode(
                  //   Theme.of(context).colorScheme.onSurface,
                  //   BlendMode.srcIn,
                  // ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
