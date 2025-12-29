import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/// Navigation item configuration for the bottom bar
class CustomBottomBarItem {
  final String route;
  final IconData icon;
  final IconData activeIcon;
  final String label;

  const CustomBottomBarItem({
    required this.route,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

/// Custom bottom navigation bar for Moroccan wedding planning app
/// Implements tab bar navigation with cultural Moroccan iconography and gold accents
/// Supports RTL layout and one-handed operation with bottom-heavy interaction design
class CustomBottomBar extends StatelessWidget {
  /// Current active route path
  final String currentRoute;

  /// Callback when navigation item is tapped
  final Function(String route)? onTap;

  /// Navigation items for the bottom bar
  /// Hardcoded based on Mobile Navigation Hierarchy from design specifications
  static const List<CustomBottomBarItem> _navigationItems = [
    CustomBottomBarItem(
      route: '/wedding-dashboard',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Dashboard',
    ),
    CustomBottomBarItem(
      route: '/guest-list-management',
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Guests',
    ),
    CustomBottomBarItem(
      route: '/budget-overview',
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      label: 'Budget',
    ),
    CustomBottomBarItem(
      route: '/traditions-checklist',
      icon: Icons.checklist_outlined,
      activeIcon: Icons.checklist,
      label: 'Traditions',
    ),
  ];

  const CustomBottomBar({super.key, required this.currentRoute, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Find current index based on route
    int currentIndex = _navigationItems.indexWhere(
      (item) => item.route == currentRoute,
    );

    // Default to first item if route not found
    if (currentIndex == -1) currentIndex = 0;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.08),
            offset: const Offset(0, -2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _navigationItems.length,
              (index) => _buildNavigationItem(
                context,
                _navigationItems[index],
                isActive: index == currentIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds individual navigation item with Moroccan design aesthetics
  Widget _buildNavigationItem(
    BuildContext context,
    CustomBottomBarItem item, {
    required bool isActive,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Gold accent for active, medium gray for inactive
    final color = isActive ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (!isActive) {
              if (onTap != null) {
                onTap!(item.route);
              } else {
                Navigator.pushNamed(context, item.route);
              }
            }
          },
          borderRadius: BorderRadius.circular(12),
          splashColor: colorScheme.primary.withValues(alpha: 0.1),
          highlightColor: colorScheme.primary.withValues(alpha: 0.05),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with subtle scale animation effect
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  transform: Matrix4.diagonal3Values(
                    isActive ? 1.1 : 1.0,
                    isActive ? 1.1 : 1.0,
                    1.0,
                  ),
                  child: Icon(
                    isActive ? item.activeIcon : item.icon,
                    size: 24,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                // Label with Inter font
                Expanded(
                  child: Text(
                    item.label,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                      color: color,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Alternative implementation using Flutter's BottomNavigationBar
/// for better platform integration and accessibility
class CustomBottomBarNative extends StatelessWidget {
  /// Current active route path
  final String currentRoute;

  /// Callback when navigation item is tapped
  final Function(String route)? onTap;

  /// Navigation items (same as CustomBottomBar)
  static const List<CustomBottomBarItem> _navigationItems = [
    CustomBottomBarItem(
      route: '/wedding-dashboard',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Dashboard',
    ),
    CustomBottomBarItem(
      route: '/guest-list-management',
      icon: Icons.people_outline,
      activeIcon: Icons.people,
      label: 'Guests',
    ),
    CustomBottomBarItem(
      route: '/budget-overview',
      icon: Icons.account_balance_wallet_outlined,
      activeIcon: Icons.account_balance_wallet,
      label: 'Budget',
    ),
    CustomBottomBarItem(
      route: '/traditions-checklist',
      icon: Icons.checklist_outlined,
      activeIcon: Icons.checklist,
      label: 'Traditions',
    ),
  ];

  const CustomBottomBarNative({
    super.key,
    required this.currentRoute,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Find current index based on route
    int currentIndex = _navigationItems.indexWhere(
      (item) => item.route == currentRoute,
    );

    // Default to first item if route not found
    if (currentIndex == -1) currentIndex = 0;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        final route = _navigationItems[index].route;
        if (onTap != null) {
          onTap!(route);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      items: _navigationItems.map((item) {

        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          activeIcon: Icon(item.activeIcon),
          label: item.label,
          tooltip: item.label,
        );
      }).toList(),
    );
  }
}
