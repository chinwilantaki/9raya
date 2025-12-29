import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Widget for displaying a tradition section with expandable tasks
class TraditionSectionWidget extends StatelessWidget {
  final Map<String, dynamic> section;
  final bool isReorderMode;
  final VoidCallback onToggleExpansion;
  final VoidCallback onToggleReorderMode;
  final Function(int, int) onReorderTasks;
  final List<Widget> taskWidgets;

  const TraditionSectionWidget({
    super.key,
    required this.section,
    required this.isReorderMode,
    required this.onToggleExpansion,
    required this.onToggleReorderMode,
    required this.onReorderTasks,
    required this.taskWidgets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpanded = section['isExpanded'] as bool;
    final progress = section['progress'] as double;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.08),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          // Section header
          InkWell(
            onTap: onToggleExpansion,
            onLongPress: onToggleReorderMode,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              section['titleEn'],
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              section['titleFr'],
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isReorderMode)
                        CustomIconWidget(
                          iconName: 'drag_handle',
                          color: theme.colorScheme.primary,
                          size: 24,
                        )
                      else
                        CustomIconWidget(
                          iconName: isExpanded ? 'expand_less' : 'expand_more',
                          color: theme.colorScheme.onSurface,
                          size: 24,
                        ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  // Progress bar
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress,
                            minHeight: 0.8.h,
                            backgroundColor: theme.colorScheme.outline
                                .withValues(alpha: 0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              theme.colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tasks list
          if (isExpanded)
            isReorderMode
                ? ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    onReorder: onReorderTasks,
                    children: taskWidgets.asMap().entries.map((entry) {
                      return Container(
                        key: ValueKey(entry.key),
                        child: entry.value,
                      );
                    }).toList(),
                  )
                : Column(children: taskWidgets),
        ],
      ),
    );
  }
}
