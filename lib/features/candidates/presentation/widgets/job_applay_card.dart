import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/active_jobs_badge.dart';
import 'package:flutter/material.dart';

class JobApplayCard extends StatelessWidget {
  const JobApplayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Applying as',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              "Marcus Rivera",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: CircleAvatar(
              radius: 25.5,
              backgroundImage: AssetImage('asset/images/image5.png'),
            ),
          ),
          AppSpacing.vertical8,
          ActiveJobsBadge(
            text: "Aoolying for",
            textStyle: Theme.of(context).textTheme.bodySmall,
            backGround: AppColors.primary50,
            circular: 8,
          ),
          AppSpacing.vertical12,
          Row(
            children: [
              Text(
                'Luminary Digital',
                style: TextStyle(
                  color: AppColors.primary600,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacing.horizontal8,
              Icon(
                Icons.verified_outlined,
                color: AppColors.success400,
                size: 16,
              ),
            ],
          ),
          AppSpacing.vertical8,
          Text(
            'Senior React Developer',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          AppSpacing.vertical12,
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('asset/images/image-cmpony.png'),
              ),
              AppSpacing.horizontal12,
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '4.9',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 18,
                          color: AppColors.warning400,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.vertical8,
                  Row(
                    children: [
                      ActiveJobsBadge(
                        text: "Remote",
                        textStyle: TextStyle(
                          color: AppColors.primary600,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        circular: 4,
                        backGround: AppColors.primary50,
                      ),
                      AppSpacing.horizontal8,
                      ActiveJobsBadge(
                        circular: 4,
                        text: "Fixed",
                        textStyle: TextStyle(
                          color: AppColors.success600,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        backGround: AppColors.success50,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppSpacing.vertical12,
          Divider(color: AppColors.gray200, height: 1.22),
          AppSpacing.vertical12,
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor et...',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          AppSpacing.vertical12,
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.primary500,
                size: 16,
              ),
              SizedBox(width: 2),
              Text('Canda', style: Theme.of(context).textTheme.bodySmall),
              AppSpacing.horizontal12,
              Icon(
                Icons.monetization_on_outlined,
                color: AppColors.primary500,
                size: 16,
              ),
              SizedBox(width: 2),
              Text('\$8K–\$12K', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          AppSpacing.vertical24,
        ],
      ),
    );
  }
}
