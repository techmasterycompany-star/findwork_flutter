import 'package:findwork_flutter/core/constants/app_spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  // TODO: Implement real data in analystics card
  final List<FlSpot> spots = const [
    FlSpot(5, 2000),
    FlSpot(10, 4000),
    FlSpot(15, 3000),
    FlSpot(20, 8000),
    FlSpot(25, 1000),
    FlSpot(30, 7000),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).colorScheme;
    return Container(
      height: 300,
      padding: EdgeInsets.all(AppSpacing.cardPadding),
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 12000,
          lineBarsData: [_buildLineChartBarData(spots, appTheme.primary)],
          gridData: FlGridData(show: true),
          titlesData: _buildTitlesData(),
        ),
      ),
    );
  }
}

LineChartBarData _buildLineChartBarData(List<FlSpot> spots, Color color) {
  return LineChartBarData(
    spots: spots,
    color: color,
    barWidth: 3,
    isCurved: true,
  );
}

FlTitlesData _buildTitlesData() {
  return FlTitlesData(
    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
  );
}
