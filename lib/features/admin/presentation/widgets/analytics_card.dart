import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key,
  });

  // TODO: Implement real data in analystics card
  final List<FlSpot> spots = const [
    FlSpot(5, 2000),
    FlSpot(10, 4000),
    FlSpot(15, 6000),
    FlSpot(20, 8000),
    FlSpot(25, 10000),
    FlSpot(30, 12000),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).colorScheme;
    return Container(
      height: 200,
      padding: EdgeInsets.all(AppSpacing.cardPadding),
      child: LineChart(LineChartData(
        minY: 0,
        maxY: 12000,
        lineBarsData: [LineChartBarData(
          spots: spots,
          color: appTheme.primary,
          barWidth: 3,
          belowBarData: BarAreaData(show: true, color: appTheme.primary)
        )],
      gridData: FlGridData(show: true)
      )
      ),
    );
  }
}
