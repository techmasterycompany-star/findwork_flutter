import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/job_info_item.dart';
import 'package:flutter/material.dart';

class ComponyOverview extends StatelessWidget {
  final bool? boolBorder;
  const ComponyOverview({super.key, this.boolBorder = false});

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
                child: Text(
                  "Company Overview",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: Text(
                  "Company Overview",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          AppSpacing.vertical12,
          Row(
            children: [
              Expanded(
                child: JobInfoItem(
                  icon: Icons.work_outline,
                  title: 'Industry',
                  value: 'Software Development',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.category_outlined,
                  title: 'Phone',
                  value: '+20 98482346',
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
                  title: 'Company Size',
                  value: '1.234',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.bar_chart_outlined,
                  title: 'Email',
                  value: 'Tech@gmail.com',
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
                  title: 'Founded In',
                  value: '2008',
                ),
              ),
              Expanded(
                child: JobInfoItem(
                  icon: Icons.school_outlined,
                  title: 'Web Site',
                  value: 'Tech.com',
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
                  title: 'Location',
                  value: 'Cairo, Egypt',
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
