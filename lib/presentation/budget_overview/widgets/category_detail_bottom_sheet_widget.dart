import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';

/// Category Detail Bottom Sheet Widget
/// Shows detailed breakdown of expenses for a specific category
/// with subcategory spending and expense history
class CategoryDetailBottomSheetWidget extends StatelessWidget {
  final Map<String, dynamic> category;
  final List<Map<String, dynamic>> expenses;

  const CategoryDetailBottomSheetWidget({
    super.key,
    required this.category,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final allocated = category["allocated"] as double;
    final spent = category["spent"] as double;
    final remaining = allocated - spent;
    final progress = spent / allocated;

    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle Bar
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Container(
              width: 12.w,
              height: 0.5.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.outline.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Color(
                      category["color"] as int,
                    ).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomIconWidget(
                    iconName: category["icon"] as String,
                    color: Color(category["color"] as int),
                    size: 28,
                  ),
                ),
                SizedBox(width: 3.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category["name"] as String,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        category["nameAr"] as String,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: CustomIconWidget(
                    iconName: 'close',
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 24,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Divider(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            thickness: 1,
          ),

          // Budget Summary
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBudgetItem(
                      context,
                      'Allocated',
                      allocated,
                      theme.colorScheme.onSurface,
                    ),
                    _buildBudgetItem(
                      context,
                      'Spent',
                      spent,
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress > 1.0 ? 1.0 : progress,
                    backgroundColor: theme.colorScheme.outline.withValues(
                      alpha: 0.2,
                    ),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress > 0.9
                          ? theme.colorScheme.error
                          : Color(category["color"] as int),
                    ),
                    minHeight: 1.5.h,
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            thickness: 1,
          ),

          // Expense History
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Expense History',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  '${expenses.length} items',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Expense List
          Expanded(
            child: expenses.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconWidget(
                          iconName: 'receipt_long',
                          color: theme.colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.5,
                          ),
                          size: 48,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'No expenses yet',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    itemCount: expenses.length,
                    separatorBuilder: (context, index) => SizedBox(height: 1.h),
                    itemBuilder: (context, index) {
                      final expense = expenses[index];
                      return _buildExpenseItem(context, expense);
                    },
                  ),
          ),
        ],
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
          '${amount.toStringAsFixed(0)}',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Text(
          'MAD',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseItem(BuildContext context, Map<String, dynamic> expense) {
    final theme = Theme.of(context);
    final amount = expense["amount"] as double;
    final date = expense["date"] as DateTime;
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Receipt Image
          if (expense["receipt"] != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomImageWidget(
                imageUrl: expense["receipt"] as String,
                width: 12.w,
                height: 12.w,
                fit: BoxFit.cover,
                semanticLabel:
                    expense["semanticLabel"] as String? ??
                    'Receipt image for expense',
              ),
            ),
          SizedBox(width: 3.w),

          // Expense Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense["description"] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.5.h),
                Text(
                  dateFormat.format(date),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            '${amount.toStringAsFixed(0)} MAD',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
