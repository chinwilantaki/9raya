import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Budget Summary Card Widget
/// Displays total budget vs spent with circular progress indicator
/// and chart visualization (pie chart or bar graph)
class BudgetSummaryCardWidget extends StatelessWidget {
  final double totalBudget;
  final double totalSpent;
  final bool isChartView;
  final List<Map<String, dynamic>> categories;

  const BudgetSummaryCardWidget({
    super.key,
    required this.totalBudget,
    required this.totalSpent,
    required this.isChartView,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = totalBudget - totalSpent;
    final percentSpent = totalSpent / totalBudget;

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with period selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Budget',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'MAD',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // Circular Progress Indicator
            Center(
              child: CircularPercentIndicator(
                radius: 18.w,
                lineWidth: 3.w,
                percent: percentSpent > 1.0 ? 1.0 : percentSpent,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${(percentSpent * 100).toStringAsFixed(0)}%',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Spent',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                progressColor: percentSpent > 0.9
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
                backgroundColor: theme.colorScheme.outline.withValues(
                  alpha: 0.2,
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(height: 2.h),

            // Budget Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBudgetItem(
                  context,
                  'Total',
                  totalBudget,
                  theme.colorScheme.onSurface,
                ),
                _buildBudgetItem(
                  context,
                  'Spent',
                  totalSpent,
                  theme.colorScheme.primary,
                ),
                _buildBudgetItem(
                  context,
                  'Remaining',
                  remaining,
                  remaining < 0
                      ? theme.colorScheme.error
                      : theme.colorScheme.secondary,
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // Chart View
            if (isChartView)
              _buildPieChart(context)
            else
              _buildBarChart(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetItem(
    BuildContext context,
    String label,
    double amount,
    Color color,
  ) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          '${amount.toStringAsFixed(0)} MAD',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildPieChart(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 25.h,
      child: Semantics(
        label: 'Budget Distribution Pie Chart',
        child: PieChart(
          PieChartData(
            sections: categories.map((category) {
              final spent = category["spent"] as double;
              final percentage = (spent / totalSpent) * 100;
              return PieChartSectionData(
                value: spent,
                title: percentage > 5
                    ? '${percentage.toStringAsFixed(0)}%'
                    : '',
                color: Color(category["color"] as int),
                radius: 12.w,
                titleStyle: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              );
            }).toList(),
            sectionsSpace: 2,
            centerSpaceRadius: 0,
          ),
        ),
      ),
    );
  }

  Widget _buildBarChart(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 25.h,
      child: Semantics(
        label: 'Budget Distribution Bar Chart',
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: categories
                .map((c) => c["allocated"] as double)
                .reduce((a, b) => a > b ? a : b),
            barGroups: categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: category["spent"] as double,
                    color: Color(category["color"] as int),
                    width: 8.w,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              );
            }).toList(),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    if (value.toInt() >= 0 &&
                        value.toInt() < categories.length) {
                      return Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Text(
                          categories[value.toInt()]["name"]
                              .toString()
                              .substring(0, 3),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}
