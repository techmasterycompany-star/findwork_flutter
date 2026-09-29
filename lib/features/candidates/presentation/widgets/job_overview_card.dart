import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import 'job_info_item.dart';

class JobOverviewCard extends StatelessWidget {
  final bool? boolBorder;
  const JobOverviewCard({super.key, this.boolBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: boolBorder == true
          ? BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEDEDF2)),
            )
          : null,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: JobInfoItem(
                  icon: Icons.work_outline,
                  title: 'Job Title',
                  value: 'UX/UI designer',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.category_outlined,
                  title: 'Job Type',
                  value: 'Full time',
                ),
              ),
            ],
          ),

          AppSpacing.vertical12,

          Row(
            children: [
              Expanded(
                child: JobInfoItem(
                  icon: Icons.calendar_today_outlined,
                  title: 'Job since',
                  value: 'Aug 12, 2021',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.bar_chart_outlined,
                  title: 'Job Level',
                  value: 'Entry Level',
                ),
              ),
            ],
          ),

          AppSpacing.vertical12,

          Row(
            children: [
              Expanded(
                child: JobInfoItem(
                  icon: Icons.attach_money,
                  title: 'Offered Salary',
                  value: '\$50k-\$60k',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.school_outlined,
                  title: 'Education',
                  value: 'Graduation',
                ),
              ),
            ],
          ),

          AppSpacing.vertical12,

          Row(
            children: [
              Expanded(
                child: JobInfoItem(
                  icon: Icons.location_on_outlined,
                  title: 'Job Location',
                  value: 'Dhaka, Bangladesh',
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
