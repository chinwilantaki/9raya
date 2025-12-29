import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Countdown timer to wedding date with large readable typography
class CountdownTimerWidget extends StatelessWidget {
  final DateTime weddingDate;

  const CountdownTimerWidget({super.key, required this.weddingDate});

  Map<String, int> _calculateTimeRemaining() {
    final now = DateTime.now();
    final difference = weddingDate.difference(now);

    return {
      'days': difference.inDays,
      'hours': difference.inHours % 24,
      'minutes': difference.inMinutes % 60,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeRemaining = _calculateTimeRemaining();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.08),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconWidget(
                iconName: 'favorite',
                color: theme.colorScheme.onPrimary,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Text(
                'Time Until Your Big Day',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeUnit(
                context,
                theme,
                timeRemaining['days'].toString(),
                'Days',
              ),
              _buildTimeSeparator(theme),
              _buildTimeUnit(
                context,
                theme,
                timeRemaining['hours'].toString().padLeft(2, '0'),
                'Hours',
              ),
              _buildTimeSeparator(theme),
              _buildTimeUnit(
                context,
                theme,
                timeRemaining['minutes'].toString().padLeft(2, '0'),
                'Minutes',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnit(
    BuildContext context,
    ThemeData theme,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.displaySmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSeparator(ThemeData theme) {
    return Text(
      ':',
      style: theme.textTheme.displaySmall?.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
