import 'package:findwork_flutter/core/constants/app_colors.dart';
import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/app_footer.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/custom_app_bar.dart';
import 'package:findwork_flutter/features/candidates/presentation/widgets/dashboard_stat_card.dart';
import 'package:flutter/material.dart';

class AnalyticsCandidatesMobile extends StatelessWidget {
  const AnalyticsCandidatesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Date Selector Dropdown
              Align(
                alignment: Alignment.centerRight,
                child: _buildDateSelector(context),
              ),
              AppSpacing.vertical12,

              // 2. Grid Cards (Metric Summary)
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
                children: const [
                  DashboardStatCard(
                    title: 'Total Applications',
                    value: '28',
                    percentage: '↑ 15%',
                    subtext: 'From last 30 days',
                    isPrimary: true,
                  ),
                  DashboardStatCard(
                    title: 'Under Review',
                    value: '6',
                    percentage: '↑ 16%',
                    subtext: 'From last 30 days',
                  ),
                  DashboardStatCard(
                    title: 'Under Review',
                    value: '6',
                    percentage: '↑ 18%',
                    subtext: 'From last 30 days',
                  ),
                  DashboardStatCard(
                    title: 'Interviews',
                    value: '5',
                    percentage: '↑ 15%',
                    subtext: 'From last 30 days',
                  ),
                ],
              ),
              AppSpacing.vertical20,

              // 3. Application over time Chart Section
              _buildCardContainer(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Application over time',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        _buildDropdownButton(context, 'last 30 days'),
                      ],
                    ),
                    AppSpacing.vertical12,
                    Row(
                      children: [
                        _buildLegendItem(AppColors.primary500, 'Applied'),
                        const SizedBox(width: 12),
                        _buildLegendItem(AppColors.success400, 'Accepted'),
                        const SizedBox(width: 12),
                        _buildLegendItem(AppColors.warning400, 'Rejected'),
                      ],
                    ),
                    AppSpacing.vertical20,
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.neutral100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Line Chart Placeholder',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical20,

              // 4. Recent Activities Section
              _buildCardContainer(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activities',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AppSpacing.vertical12,
                    _buildActivityTile(
                      company: 'Tech Company',
                      role: 'UI/UX Designer',
                      jobType: 'Full-time',
                      status: 'Pending',
                      date: '25 Aug 2026',
                      statusColor: AppColors.warning500,
                      statusBg: AppColors.warning50,
                    ),
                    _buildActivityTile(
                      company: 'Tech Company',
                      role: 'UI/UX Designer',
                      jobType: 'Full-time',
                      status: 'Accepted',
                      date: '25 Aug 2026',
                      statusColor: AppColors.success600,
                      statusBg: AppColors.success50,
                    ),
                    _buildActivityTile(
                      company: 'Tech Company',
                      role: 'UI/UX Designer',
                      jobType: 'Full-time',
                      status: 'Pending',
                      date: '25 Aug 2026',
                      statusColor: AppColors.warning500,
                      statusBg: AppColors.warning50,
                    ),
                    _buildActivityTile(
                      company: 'Tech Company',
                      role: 'UI/UX Designer',
                      jobType: 'Full-time',
                      status: 'Rejected',
                      date: '25 Aug 2026',
                      statusColor: AppColors.error500,
                      statusBg: AppColors.error50,
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical20,

              // 5. Most Applied Job Categories
              _buildCardContainer(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Most Applied Job Categories',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AppSpacing.vertical20,
                    _buildProgressBarRow('UI/UX Design', 0.85, '48'),
                    AppSpacing.vertical12,
                    _buildProgressBarRow('Product Design', 0.70, '40'),
                    AppSpacing.vertical12,
                    _buildProgressBarRow('Graphic', 0.50, '31'),
                    AppSpacing.vertical12,
                    _buildProgressBarRow('Frontend', 0.25, '18'),
                  ],
                ),
              ),
              AppSpacing.vertical20,

              // 6. Applications by Status
              _buildCardContainer(
                context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Applications by Status',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    AppSpacing.vertical20,
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              const CircularProgressIndicator(
                                value: 0.75,
                                strokeWidth: 14,
                                color: AppColors.primary500,
                                backgroundColor: AppColors.success400,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '28',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    'Total',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            children: [
                              _buildStatusLegend(
                                'Pending',
                                '8 (33.5%)',
                                AppColors.warning400,
                              ),
                              AppSpacing.vertical8,
                              _buildStatusLegend(
                                'Interview',
                                '6 (25.5%)',
                                AppColors.primary400,
                              ),
                              AppSpacing.vertical8,
                              _buildStatusLegend(
                                'Accepted',
                                '4 (13.5%)',
                                AppColors.success400,
                              ),
                              AppSpacing.vertical8,
                              _buildStatusLegend(
                                'Rejected',
                                '10 (10.5%)',
                                AppColors.error400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical20,
              AppFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCardContainer(BuildContext context, {required Widget child}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(AppSpacing.cardPadding),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
      border: Border.all(color: AppColors.neutral200),
    ),
    child: child,
  );
}

Widget _buildDateSelector(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      color: Theme.of(context).colorScheme.surface,
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 16,
          color: AppColors.neutral600,
        ),
        SizedBox(width: 8),
        Text(
          'May 28, 2026',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 4),
        Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.neutral600),
      ],
    ),
  );
}

Widget _buildDropdownButton(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const Icon(
          Icons.keyboard_arrow_down,
          size: 14,
          color: AppColors.neutral500,
        ),
      ],
    ),
  );
}

Widget _buildLegendItem(Color color, String label) {
  return Row(
    children: [
      CircleAvatar(radius: 4, backgroundColor: color),
      const SizedBox(width: 4),
      Text(
        label,
        style: const TextStyle(fontSize: 11, color: AppColors.neutral600),
      ),
    ],
  );
}

Widget _buildStatusLegend(String title, String value, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(radius: 4, backgroundColor: color),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: AppColors.neutral600),
          ),
        ],
      ),
      Text(
        value,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

Widget _buildActivityTile({
  required String company,
  required String role,
  required String jobType,
  required String status,
  required String date,
  required Color statusColor,
  required Color statusBg,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'asset/images/image-cmpony.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      company,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.primary600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    _buildChip(
                      jobType,
                      AppColors.success50,
                      AppColors.success600,
                    ),
                    const SizedBox(width: 6),
                    _buildChip(status, statusBg, statusColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildChip(String text, Color bg, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 9, color: color, fontWeight: FontWeight.w600),
    ),
  );
}

Widget _buildProgressBarRow(String label, double progress, String count) {
  return Row(
    children: [
      SizedBox(
        width: 90,
        child: Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.neutral600),
        ),
      ),
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            color: AppColors.primary500,
            backgroundColor: AppColors.neutral100,
          ),
        ),
      ),
      const SizedBox(width: 12),
      Text(
        count,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
