import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_widget.dart';
import './widgets/add_expense_bottom_sheet_widget.dart';
import './widgets/budget_summary_card_widget.dart';
import './widgets/category_detail_bottom_sheet_widget.dart';
import './widgets/expense_category_card_widget.dart';
import './widgets/recent_expense_item_widget.dart';

/// Budget Overview Screen
/// Comprehensive financial tracking for Moroccan wedding expenses
/// with visual spending analysis and category management
class BudgetOverview extends StatefulWidget {
  const BudgetOverview({super.key});

  @override
  State<BudgetOverview> createState() => _BudgetOverviewState();
}

class _BudgetOverviewState extends State<BudgetOverview> {
  bool _isChartView = true; // Toggle between pie chart and bar graph


  // Mock data for budget overview
  final double _totalBudget = 150000.0; // MAD
  final double _totalSpent = 87500.0; // MAD

  // Mock expense categories with Moroccan wedding context
  final List<Map<String, dynamic>> _expenseCategories = [
    {
      "id": 1,
      "name": "Venue",
      "nameAr": "القاعة",
      "icon": "location_city",
      "allocated": 40000.0,
      "spent": 40000.0,
      "color": 0xFFD4AF37, // Gold
    },
    {
      "id": 2,
      "name": "Catering",
      "nameAr": "الطعام",
      "icon": "restaurant",
      "allocated": 35000.0,
      "spent": 28000.0,
      "color": 0xFF50C878, // Emerald
    },
    {
      "id": 3,
      "name": "Neggafa",
      "nameAr": "النڭافة",
      "icon": "checkroom",
      "allocated": 25000.0,
      "spent": 12000.0,
      "color": 0xFFFFC107, // Amber
    },
    {
      "id": 4,
      "name": "Band",
      "nameAr": "الفرقة",
      "icon": "music_note",
      "allocated": 20000.0,
      "spent": 5000.0,
      "color": 0xFFDC3545, // Red
    },
    {
      "id": 5,
      "name": "Photographer",
      "nameAr": "المصور",
      "icon": "camera_alt",
      "allocated": 18000.0,
      "spent": 2500.0,
      "color": 0xFF28A745, // Green
    },
    {
      "id": 6,
      "name": "Decor",
      "nameAr": "الديكور",
      "icon": "celebration",
      "allocated": 12000.0,
      "spent": 0.0,
      "color": 0xFF6C757D, // Gray
    },
  ];

  // Mock recent expenses
  final List<Map<String, dynamic>> _recentExpenses = [
    {
      "id": 1,
      "category": "Venue",
      "categoryAr": "القاعة",
      "amount": 40000.0,
      "description": "Riad Fes - Full venue booking",
      "descriptionAr": "رياض فاس - حجز القاعة كاملة",
      "date": DateTime(2025, 12, 15),
      "receipt": "https://images.unsplash.com/photo-1730058644953-0f4ad6cd7b52",
      "semanticLabel": "Elegant Moroccan riad courtyard with traditional zellige tilework and fountain",
    },
    {
      "id": 2,
      "category": "Catering",
      "categoryAr": "الطعام",
      "amount": 28000.0,
      "description": "Traditional Moroccan menu - 200 guests",
      "descriptionAr": "قائمة مغربية تقليدية - 200 ضيف",
      "date": DateTime(2025, 12, 20),
      "receipt": "https://images.unsplash.com/photo-1701819156756-e0b8d60948ce",
      "semanticLabel": "Assorted Moroccan dishes including tagine and couscous on decorative plates",
    },
    {
      "id": 3,
      "category": "Neggafa",
      "categoryAr": "النڭافة",
      "amount": 12000.0,
      "description": "Neggafa services - 5 outfit changes",
      "descriptionAr": "خدمات النڭافة - 5 تغييرات ملابس",
      "date": DateTime(2025, 12, 22),
      "receipt": "https://img.rocket.new/generatedImages/rocket_gen_img_156988439-1766945066816.png",
      "semanticLabel": "Traditional Moroccan wedding caftan with gold embroidery and jeweled belt",
    },
    {
      "id": 4,
      "category": "Band",
      "categoryAr": "الفرقة",
      "amount": 5000.0,
      "description": "Deposit for Chaabi band",
      "descriptionAr": "عربون فرقة الشعبي",
      "date": DateTime(2025, 12, 25),
      "receipt": "https://img.rocket.new/generatedImages/rocket_gen_img_1d7b33645-1765808224111.png",
      "semanticLabel": "Traditional Moroccan musicians performing with drums and string instruments",
    },
    {
      "id": 5,
      "category": "Photographer",
      "categoryAr": "المصور",
      "amount": 2500.0,
      "description": "Booking deposit - Photo & Video",
      "descriptionAr": "عربون الحجز - صور وفيديو",
      "date": DateTime(2025, 12, 26),
      "receipt": "https://images.unsplash.com/photo-1695139416061-20e404909ac1",
      "semanticLabel": "Professional photographer with camera equipment at wedding venue",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Budget Overview',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: CustomIconWidget(
              iconName: _isChartView ? 'bar_chart' : 'pie_chart',
              color: theme.colorScheme.primary,
              size: 24,
            ),
            onPressed: () {
              setState(() {
                _isChartView = !_isChartView;
              });
            },
            tooltip: _isChartView ? 'Switch to Bar Chart' : 'Switch to Pie Chart',
          ),
          SizedBox(width: 2.w),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: theme.colorScheme.primary,
        child: CustomScrollView(
          slivers: [
            // Budget Summary Card
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: BudgetSummaryCardWidget(
                  totalBudget: _totalBudget,
                  totalSpent: _totalSpent,
                  isChartView: _isChartView,
                  categories: _expenseCategories,
                ),
              ),
            ),

            // Section Header - Expense Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Text(
                  'Expense Categories',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            // Horizontal Scrollable Category Cards
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  itemCount: _expenseCategories.length,
                  itemBuilder: (context, index) {
                    final category = _expenseCategories[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: ExpenseCategoryCardWidget(
                        category: category,
                        onTap: () => _showCategoryDetails(category),
                        onLongPress: () => _showCategoryDetails(category),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 2.h).toBoxAdapter(),

            // Section Header - Recent Expenses
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Expenses',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to full expense history
                      },
                      child: Text(
                        'View All',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recent Expenses List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final expense = _recentExpenses[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.5.h),
                    child: Dismissible(
                      key: Key(expense["id"].toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.error,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomIconWidget(
                          iconName: 'delete',
                          color: theme.colorScheme.onError,
                          size: 24,
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _recentExpenses.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Expense deleted'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                setState(() {
                                  _recentExpenses.insert(index, expense);
                                });
                              },
                            ),
                          ),
                        );
                      },
                      child: RecentExpenseItemWidget(
                        expense: expense,
                        onTap: () => _editExpense(expense),
                      ),
                    ),
                  );
                },
                childCount: _recentExpenses.length,
              ),
            ),

            // Bottom padding for FAB
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddExpenseSheet,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        icon: CustomIconWidget(
          iconName: 'add',
          color: theme.colorScheme.onPrimary,
          size: 24,
        ),
        label: Text(
          'Add Expense',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentRoute: '/budget-overview',
        onTap: (route) {
          if (route != '/budget-overview') {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }

  /// Handle pull-to-refresh
  Future<void> _handleRefresh() async {


    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));



    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Budget data refreshed'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  /// Show add expense bottom sheet
  void _showAddExpenseSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddExpenseBottomSheetWidget(
        categories: _expenseCategories,
        onExpenseAdded: (expense) {
          setState(() {
            _recentExpenses.insert(0, expense);
          });
        },
      ),
    );
  }

  /// Show category details bottom sheet
  void _showCategoryDetails(Map<String, dynamic> category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CategoryDetailBottomSheetWidget(
        category: category,
        expenses: _recentExpenses
            .where((e) => e["category"] == category["name"])
            .toList(),
      ),
    );
  }

  /// Edit expense
  void _editExpense(Map<String, dynamic> expense) {
    // Navigate to expense entry screen or show edit dialog
    Navigator.pushNamed(context, '/expense-entry', arguments: expense);
  }
}

/// Extension to convert SizedBox to SliverToBoxAdapter
extension SizedBoxExtension on SizedBox {
  Widget toBoxAdapter() => SliverToBoxAdapter(child: this);
}