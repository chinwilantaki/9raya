import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/app_export.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_icon_widget.dart';
import './widgets/countdown_timer_widget.dart';
import './widgets/greeting_header_widget.dart';
import './widgets/progress_overview_widget.dart';
import './widgets/quick_action_cards_widget.dart';
import './widgets/recent_activity_feed_widget.dart';

/// Wedding Dashboard - Central hub for wedding planning
/// Provides comprehensive overview with tab navigation
class WeddingDashboard extends StatefulWidget {
  const WeddingDashboard({super.key});

  @override
  State<WeddingDashboard> createState() => _WeddingDashboardState();
}

class _WeddingDashboardState extends State<WeddingDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;



  // Mock wedding data
  final Map<String, dynamic> _weddingData = {
    "coupleName": "أحمد و فاطمة",
    "weddingDate": DateTime(2025, 6, 15),
    "currentEvent": "Main Wedding",
    "events": ["Khitba", "Henna", "Hammam", "Draga", "Main Wedding"],
    "progress": {"guests": 75, "budget": 60, "vendors": 85, "traditions": 45},
    "recentActivities": [
      {
        "id": 1,
        "category": "Guest",
        "action": "Added 5 new guests to bride's family",
        "timestamp": DateTime.now().subtract(const Duration(hours: 2)),
        "icon": "people",
      },
      {
        "id": 2,
        "category": "Budget",
        "action": "Logged expense: Venue deposit - 15,000 MAD",
        "timestamp": DateTime.now().subtract(const Duration(hours: 5)),
        "icon": "account_balance_wallet",
      },
      {
        "id": 3,
        "category": "Vendor",
        "action": "Confirmed photographer booking",
        "timestamp": DateTime.now().subtract(const Duration(days: 1)),
        "icon": "camera_alt",
      },
      {
        "id": 4,
        "category": "Tradition",
        "action": "Completed: Book Neggafa service",
        "timestamp": DateTime.now().subtract(const Duration(days: 2)),
        "icon": "checklist",
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {


    // Simulate data sync with haptic feedback
    await Future.delayed(const Duration(milliseconds: 1500));



    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.weddingDashboard_dataSyncedSuccessfully,
            style: Theme.of(context).snackBarTheme.contentTextStyle,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _handleQuickAction(String action) {
    switch (action) {
      case 'add_guest':
        Navigator.pushNamed(context, '/guest-list-management');
        break;
      case 'log_expense':
        Navigator.pushNamed(context, '/expense-entry');
        break;
      case 'check_tradition':
        Navigator.pushNamed(context, '/traditions-checklist');
        break;
    }
  }

  void _handleBottomNavTap(String route) {
    if (route == '/wedding-dashboard') {

    } else {
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: theme.appBarTheme.elevation,
        centerTitle: true,
        title: Text(appLocalizations.weddingDashboard_weddingPlanner, style: theme.appBarTheme.titleTextStyle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              if (localeProvider.locale.languageCode == 'en') {
                localeProvider.setLocale(const Locale('fr'));
              } else {
                localeProvider.setLocale(const Locale('en'));
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: theme.tabBarTheme.labelColor,
          unselectedLabelColor: theme.tabBarTheme.unselectedLabelColor,
          indicatorColor: theme.tabBarTheme.indicatorColor,
          labelStyle: theme.tabBarTheme.labelStyle,
          unselectedLabelStyle: theme.tabBarTheme.unselectedLabelStyle,
          tabs: [
            Tab(text: appLocalizations.weddingDashboard_dashboard),
            Tab(text: appLocalizations.weddingDashboard_timeline),
            Tab(text: appLocalizations.weddingDashboard_guests),
            Tab(text: appLocalizations.weddingDashboard_budget),
            Tab(text: appLocalizations.weddingDashboard_vendors),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDashboardTab(theme),
          _buildPlaceholderTab(appLocalizations.weddingDashboard_timeline, theme),
          _buildPlaceholderTab(appLocalizations.weddingDashboard_guests, theme),
          _buildPlaceholderTab(appLocalizations.weddingDashboard_budget, theme),
          _buildPlaceholderTab(appLocalizations.weddingDashboard_vendors, theme),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        currentRoute: '/wedding-dashboard',
        onTap: _handleBottomNavTap,
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
              onPressed: () => _showQuickAddBottomSheet(context, theme),
              icon: CustomIconWidget(
                iconName: 'add',
                color: theme.floatingActionButtonTheme.foregroundColor!,
                size: 24,
              ),
              label: Text(
                appLocalizations.weddingDashboard_quickAdd,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.floatingActionButtonTheme.foregroundColor,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildDashboardTab(ThemeData theme) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      color: theme.colorScheme.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Header
                GreetingHeaderWidget(
                  coupleName: _weddingData["coupleName"] as String,
                ),
                SizedBox(height: 2.h),

                // Countdown Timer
                CountdownTimerWidget(
                  weddingDate: _weddingData["weddingDate"] as DateTime,
                ),
                SizedBox(height: 3.h),

                // Progress Overview
                ProgressOverviewWidget(
                  progressData:
                      _weddingData["progress"] as Map<String, dynamic>,
                ),
                SizedBox(height: 3.h),

                // Quick Action Cards
                QuickActionCardsWidget(onActionTap: _handleQuickAction),
                SizedBox(height: 3.h),

                // Recent Activity Feed
                RecentActivityFeedWidget(
                  activities:
                      _weddingData["recentActivities"]
                          as List<Map<String, dynamic>>,
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderTab(String tabName, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconWidget(
            iconName: 'construction',
            color: theme.colorScheme.onSurfaceVariant,
            size: 64,
          ),
          SizedBox(height: 2.h),
          Text(
            AppLocalizations.of(context)!.weddingDashboard_tabNameComingSoon(tabName),
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            AppLocalizations.of(context)!.weddingDashboard_thisFeatureIsUnderDevelopment,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  void _showQuickAddBottomSheet(BuildContext context, ThemeData theme) {
    final appLocalizations = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              appLocalizations.weddingDashboard_quickActions,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 2.h),
            _buildQuickActionItem(context, theme, appLocalizations.weddingDashboard_addGuest, 'people', () {
              Navigator.pop(context);
              _handleQuickAction('add_guest');
            }),
            _buildQuickActionItem(
              context,
              theme,
              appLocalizations.weddingDashboard_logExpense,
              'account_balance_wallet',
              () {
                Navigator.pop(context);
                _handleQuickAction('log_expense');
              },
            ),
            _buildQuickActionItem(
              context,
              theme,
              appLocalizations.weddingDashboard_checkTradition,
              'checklist',
              () {
                Navigator.pop(context);
                _handleQuickAction('check_tradition');
              },
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem(
    BuildContext context,
    ThemeData theme,
    String title,
    String iconName,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: CustomIconWidget(
                  iconName: iconName,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            CustomIconWidget(
              iconName: 'chevron_right',
              color: theme.colorScheme.onSurfaceVariant,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
