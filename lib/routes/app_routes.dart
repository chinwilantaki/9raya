import 'package:flutter/material.dart';
import '../presentation/traditions_checklist/traditions_checklist.dart';
import '../presentation/wedding_dashboard/wedding_dashboard.dart';
import '../presentation/splash_screen/splash_screen.dart';
import '../presentation/budget_overview/budget_overview.dart';
import '../presentation/expense_entry/expense_entry.dart';
import '../presentation/guest_list_management/guest_list_management.dart';
import '../presentation/country_selection/country_selection.dart';
import '../presentation/language_selection/language_selection.dart';

class AppRoutes {
  static const String initial = '/';
  static const String traditionsChecklist = '/traditions-checklist';
  static const String weddingDashboard = '/wedding-dashboard';
  static const String budgetOverview = '/budget-overview';
  static const String expenseEntry = '/expense-entry';
  static const String guestListManagement = '/guest-list-management';
  static const String countrySelection = '/country-selection';
  static const String languageSelection = '/language-selection';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const SplashScreen(),
    traditionsChecklist: (context) => const TraditionsChecklist(),
    weddingDashboard: (context) => const WeddingDashboard(),
    budgetOverview: (context) => const BudgetOverview(),
    expenseEntry: (context) => const ExpenseEntry(),
    guestListManagement: (context) => const GuestListManagement(),
    countrySelection: (context) => const CountrySelection(),
    languageSelection: (context) => const LanguageSelection(),
  };
}
