import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

/// Progress overview with circular indicators for each planning category
class ProgressOverviewWidget extends StatelessWidget {
  final Map<String, dynamic> progressData;

  const ProgressOverviewWidget({super.key, required this.progressData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Planning Progress',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 2.h),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 2.h,
          crossAxisSpacing: 4.w,
          childAspectRatio: 1.1,
          children: [
            _buildProgressCard(
              context,
              theme,
              'Guests',
              'people',
              progressData['guests'] as int,
              theme.colorScheme.primary,
            ),
            _buildProgressCard(
              context,
              theme,
              'Budget',
              'account_balance_wallet',
              progressData['budget'] as int,
              theme.colorScheme.secondary,
            ),
            _buildProgressCard(
              context,
              theme,
              'Vendors',
              'store',
              progressData['vendors'] as int,
              theme.colorScheme.tertiary,
            ),
            _buildProgressCard(
              context,
              theme,
              'Traditions',
              'checklist',
              progressData['traditions'] as int,
              AppTheme.successGreen,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressCard(
    BuildContext context,
    ThemeData theme,
    String title,
    String iconName,
    int percentage,
    Color color,
  ) {
    return GestureDetector(
      onLongPress: () =>
          _showDetailedBreakdown(context, theme, title, percentage),
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.05),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 35,
              lineWidth: 8,
              percent: percentage / 100,
              center: Text(
                '$percentage%',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              progressColor: color,
              backgroundColor: color.withValues(alpha: 0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: 1.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconWidget(iconName: iconName, color: color, size: 20),
                SizedBox(width: 1.w),
                Flexible(
                  child: Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailedBreakdown(
    BuildContext context,
    ThemeData theme,
    String category,
    int percentage,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: theme.dialogTheme.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          '$category Progress',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Completion: $percentage%',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 1.h),
            LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Detailed breakdown coming soon',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
