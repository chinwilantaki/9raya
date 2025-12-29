import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Variant types for the custom app bar
enum CustomAppBarVariant {
  /// Standard app bar with title and optional actions
  standard,

  /// App bar with back button and title
  withBack,

  /// App bar with search functionality
  search,

  /// App bar with centered title and minimal design
  centered,

  /// App bar with custom leading widget
  custom,
}

/// Custom app bar for Moroccan wedding planning app
/// Implements elegant confidence with cultural design elements
/// Supports RTL layout and platform-aware navigation patterns
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Title text displayed in the app bar
  final String? title;

  /// Variant type determining the app bar layout
  final CustomAppBarVariant variant;

  /// Leading widget (overrides default back button)
  final Widget? leading;

  /// Action widgets displayed on the right side
  final List<Widget>? actions;

  /// Callback when back button is pressed
  final VoidCallback? onBackPressed;

  /// Callback when search is submitted
  final Function(String)? onSearchSubmitted;

  /// Whether to show elevation shadow
  final bool showElevation;

  /// Background color override
  final Color? backgroundColor;

  /// Whether to center the title
  final bool centerTitle;

  /// Custom bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.variant = CustomAppBarVariant.standard,
    this.leading,
    this.actions,
    this.onBackPressed,
    this.onSearchSubmitted,
    this.showElevation = true,
    this.backgroundColor,
    this.centerTitle = true,
    this.bottom,
  });

  /// Factory constructor for standard app bar
  factory CustomAppBar.standard({
    Key? key,
    required String title,
    List<Widget>? actions,
    bool centerTitle = true,
    PreferredSizeWidget? bottom,
  }) {
    return CustomAppBar(
      key: key,
      title: title,
      variant: CustomAppBarVariant.standard,
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }

  /// Factory constructor for app bar with back button
  factory CustomAppBar.withBack({
    Key? key,
    required String title,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
    bool centerTitle = true,
  }) {
    return CustomAppBar(
      key: key,
      title: title,
      variant: CustomAppBarVariant.withBack,
      onBackPressed: onBackPressed,
      actions: actions,
      centerTitle: centerTitle,
    );
  }

  /// Factory constructor for search app bar
  factory CustomAppBar.search({
    Key? key,
    String? title,
    required Function(String) onSearchSubmitted,
    VoidCallback? onBackPressed,
  }) {
    return CustomAppBar(
      key: key,
      title: title,
      variant: CustomAppBarVariant.search,
      onSearchSubmitted: onSearchSubmitted,
      onBackPressed: onBackPressed,
    );
  }

  /// Factory constructor for centered minimal app bar
  factory CustomAppBar.centered({
    Key? key,
    required String title,
    List<Widget>? actions,
  }) {
    return CustomAppBar(
      key: key,
      title: title,
      variant: CustomAppBarVariant.centered,
      actions: actions,
      centerTitle: true,
      showElevation: false,
    );
  }

  @override
  Size get preferredSize {
    double height = kToolbarHeight;
    if (bottom != null) {
      height += bottom!.preferredSize.height;
    }
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppBar(
      backgroundColor: backgroundColor ?? colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: showElevation ? 1.0 : 0.0,
      shadowColor: showElevation ? colorScheme.shadow : Colors.transparent,
      centerTitle: centerTitle,
      leading: _buildLeading(context),
      title: _buildTitle(context),
      actions: _buildActions(context),
      bottom: bottom,
    );
  }

  /// Builds the leading widget based on variant
  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;

    switch (variant) {
      case CustomAppBarVariant.withBack:
      case CustomAppBarVariant.search:
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          tooltip: 'Back',
        );
      case CustomAppBarVariant.standard:
      case CustomAppBarVariant.centered:
      case CustomAppBarVariant.custom:
        return null;
    }
  }

  /// Builds the title widget based on variant
  Widget? _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (variant == CustomAppBarVariant.search) {
      return _SearchField(
        onSubmitted: onSearchSubmitted,
        colorScheme: colorScheme,
      );
    }

    if (title == null) return null;

    return Text(
      title!,
      style: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        letterSpacing: 0.15,
      ),
    );
  }

  /// Builds the action widgets
  List<Widget>? _buildActions(BuildContext context) {
    if (actions == null || actions!.isEmpty) return null;

    return actions!.map((action) {
      // Ensure proper padding for touch targets
      if (action is IconButton) {
        return action;
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: action,
      );
    }).toList();
  }
}

/// Internal search field widget for search app bar variant
class _SearchField extends StatefulWidget {
  final Function(String)? onSubmitted;
  final ColorScheme colorScheme;

  const _SearchField({required this.onSubmitted, required this.colorScheme});

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: widget.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.colorScheme.outline.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: widget.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.colorScheme.onSurfaceVariant,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: widget.colorScheme.onSurfaceVariant,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 20,
                    color: widget.colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    _controller.clear();
                    setState(() {});
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        onSubmitted: widget.onSubmitted,
        onChanged: (value) => setState(() {}),
        textInputAction: TextInputAction.search,
      ),
    );
  }
}

/// Action button for app bar with Moroccan design aesthetics
class CustomAppBarAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final Color? color;
  final bool showBadge;
  final String? badgeLabel;

  const CustomAppBarAction({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
    this.showBadge = false,
    this.badgeLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget iconButton = IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      tooltip: tooltip,
      color: color ?? colorScheme.onSurface,
      iconSize: 24,
    );

    if (showBadge) {
      return Badge(
        label: badgeLabel != null ? Text(badgeLabel!) : null,
        backgroundColor: colorScheme.error,
        textColor: colorScheme.onError,
        child: iconButton,
      );
    }

    return iconButton;
  }
}
