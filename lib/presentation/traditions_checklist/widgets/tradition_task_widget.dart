import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_widget.dart';

/// Widget for displaying individual tradition task with swipe actions
class TraditionTaskWidget extends StatelessWidget {
  final Map<String, dynamic> task;
  final String sectionId;
  final VoidCallback onToggleCompletion;
  final VoidCallback onShowDetails;

  const TraditionTaskWidget({
    super.key,
    required this.task,
    required this.sectionId,
    required this.onToggleCompletion,
    required this.onShowDetails,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = task['isCompleted'] as bool;

    return Dismissible(
      key: Key('${sectionId}_${task['id']}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        onToggleCompletion();
        return false; // Don't actually dismiss, just trigger completion
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 4.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CustomIconWidget(
          iconName: 'check_circle',
          color: theme.colorScheme.onSecondary,
          size: 32,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isCompleted
              ? theme.colorScheme.secondaryContainer.withValues(alpha: 0.3)
              : theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: onShowDetails,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Row(
              children: [
                // Checkbox
                GestureDetector(
                  onTap: onToggleCompletion,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isCompleted
                            ? theme.colorScheme.secondary
                            : theme.colorScheme.outline,
                        width: 2,
                      ),
                      color: isCompleted
                          ? theme.colorScheme.secondary
                          : Colors.transparent,
                    ),
                    child: isCompleted
                        ? CustomIconWidget(
                            iconName: 'check',
                            color: theme.colorScheme.onSecondary,
                            size: 16,
                          )
                        : null,
                  ),
                ),
                SizedBox(width: 3.w),

                // Task details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task['nameEn'],
                        style: theme.textTheme.titleMedium?.copyWith(
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: isCompleted
                              ? theme.colorScheme.onSurfaceVariant
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        task['nameFr'],
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          CustomIconWidget(
                            iconName: 'schedule',
                            color: theme.colorScheme.primary,
                            size: 14,
                          ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Text(
                              task['timing'],
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Info icon
                CustomIconWidget(
                  iconName: 'info_outline',
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
