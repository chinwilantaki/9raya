import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that contains all theme configurations for the Moroccan wedding planning application.
/// Implements Contemporary Moroccan Minimalism with Heritage Gold Palette.
class AppTheme {
  AppTheme._();

  // Heritage Gold Palette - Color Specifications
  static const Color primaryGold = Color(
    0xFFD4AF37,
  ); // Traditional Moroccan gold
  static const Color emeraldGreen = Color(0xFF50C878); // Calming accent
  static const Color pureWhite = Color(0xFFFFFFFF); // Primary background
  static const Color warmGray = Color(0xFFF8F9FA); // Secondary background
  static const Color charcoalText = Color(0xFF2C3E50); // Primary text
  static const Color mediumGray = Color(0xFF6C757D); // Secondary text
  static const Color lightBorder = Color(0xFFE9ECEF); // Subtle dividers
  static const Color successGreen = Color(0xFF28A745); // Confirmation states
  static const Color warningAmber = Color(0xFFFFC107); // Budget alerts
  static const Color errorRed = Color(0xFFDC3545); // Critical alerts

  // Dark theme adaptations
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color surfaceDark = Color(0xFF2D2D2D);
  static const Color cardDark = Color(0xFF242424);
  static const Color textHighEmphasisDark = Color(0xFFE8E8E8);
  static const Color textMediumEmphasisDark = Color(0xFFB0B0B0);
  static const Color textDisabledDark = Color(0xFF6C6C6C);

  // Shadow colors with subtle elevation (opacity never exceeds 0.1)
  static const Color shadowLight = Color(0x1A000000); // 10% opacity
  static const Color shadowDark = Color(0x1AFFFFFF); // 10% opacity

  // Text emphasis levels for light theme
  static const Color textHighEmphasisLight = charcoalText;
  static const Color textMediumEmphasisLight = mediumGray;
  static const Color textDisabledLight = Color(0xFFADB5BD);

  /// Light theme - Elegant Confidence with Contemporary Moroccan Minimalism
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryGold,
      onPrimary: pureWhite,
      primaryContainer: primaryGold,
      onPrimaryContainer: charcoalText,
      secondary: emeraldGreen,
      onSecondary: pureWhite,
      secondaryContainer: emeraldGreen,
      onSecondaryContainer: charcoalText,
      tertiary: warningAmber,
      onTertiary: charcoalText,
      tertiaryContainer: warningAmber,
      onTertiaryContainer: charcoalText,
      error: errorRed,
      onError: pureWhite,
      surface: pureWhite,
      onSurface: charcoalText,
      onSurfaceVariant: mediumGray,
      outline: lightBorder,
      outlineVariant: lightBorder,
      shadow: shadowLight,
      scrim: shadowLight,
      inverseSurface: charcoalText,
      onInverseSurface: pureWhite,
      inversePrimary: primaryGold,
    ),
    scaffoldBackgroundColor: pureWhite,
    cardColor: warmGray,
    dividerColor: lightBorder,

    // AppBar with cultural elegance
    appBarTheme: AppBarThemeData(
      backgroundColor: pureWhite,
      foregroundColor: charcoalText,
      elevation: 1.0,
      shadowColor: shadowLight,
      centerTitle: true,
      titleTextStyle: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: charcoalText,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: charcoalText, size: 24),
    ),

    // Card with subtle elevation (8px border radius)
    cardTheme: CardThemeData(
      color: warmGray,
      elevation: 2.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Bottom Navigation with gold accent
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: pureWhite,
      selectedItemColor: primaryGold,
      unselectedItemColor: mediumGray,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 4.0,
    ),

    // FAB with emerald green
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: emeraldGreen,
      foregroundColor: pureWhite,
      elevation: 4.0,
      shape: CircleBorder(),
    ),

    // Elevated Button with gold primary
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: pureWhite,
        backgroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 2.0,
        shadowColor: shadowLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Outlined Button with minimal border
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: const BorderSide(color: lightBorder, width: 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Text Button with gold accent
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Typography with Playfair Display and Inter
    textTheme: _buildTextTheme(isLight: true),

    // Input decoration with focused gold border
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: pureWhite,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: lightBorder, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: lightBorder, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryGold, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorRed, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorRed, width: 2.0),
      ),
      labelStyle: GoogleFonts.inter(
        color: mediumGray,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textDisabledLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: mediumGray,
      suffixIconColor: mediumGray,
    ),

    // Switch with gold accent
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return mediumGray;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold.withValues(alpha: 0.5);
        }
        return lightBorder;
      }),
    ),

    // Checkbox with gold accent
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(pureWhite),
      side: const BorderSide(color: lightBorder, width: 2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),

    // Radio with gold accent
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return mediumGray;
      }),
    ),

    // Progress indicator with gold
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryGold,
      linearTrackColor: lightBorder,
      circularTrackColor: lightBorder,
    ),

    // Slider with gold accent
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryGold,
      thumbColor: primaryGold,
      overlayColor: primaryGold.withValues(alpha: 0.2),
      inactiveTrackColor: lightBorder,
      valueIndicatorColor: primaryGold,
      valueIndicatorTextStyle: GoogleFonts.inter(
        color: pureWhite,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Tab Bar with gold indicator
    tabBarTheme: TabBarThemeData(
      labelColor: primaryGold,
      unselectedLabelColor: mediumGray,
      indicatorColor: primaryGold,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
    ),

    // Tooltip with subtle styling
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: charcoalText.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: GoogleFonts.inter(
        color: pureWhite,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // SnackBar with elegant styling
    snackBarTheme: SnackBarThemeData(
      backgroundColor: charcoalText,
      contentTextStyle: GoogleFonts.inter(
        color: pureWhite,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: primaryGold,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
    ),

    // Divider with light border
    dividerTheme: const DividerThemeData(
      color: lightBorder,
      thickness: 1.0,
      space: 1.0,
    ),

    // Chip with warm gray background
    chipTheme: ChipThemeData(
      backgroundColor: warmGray,
      selectedColor: primaryGold,
      disabledColor: lightBorder,
      labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
      secondaryLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: pureWhite,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ), dialogTheme: DialogThemeData(backgroundColor: pureWhite),
  );

  /// Dark theme - Elegant Confidence with Contemporary Moroccan Minimalism (Dark Mode)
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primaryGold,
      onPrimary: backgroundDark,
      primaryContainer: primaryGold,
      onPrimaryContainer: textHighEmphasisDark,
      secondary: emeraldGreen,
      onSecondary: backgroundDark,
      secondaryContainer: emeraldGreen,
      onSecondaryContainer: textHighEmphasisDark,
      tertiary: warningAmber,
      onTertiary: backgroundDark,
      tertiaryContainer: warningAmber,
      onTertiaryContainer: textHighEmphasisDark,
      error: errorRed,
      onError: pureWhite,
      surface: surfaceDark,
      onSurface: textHighEmphasisDark,
      onSurfaceVariant: textMediumEmphasisDark,
      outline: Color(0xFF3D3D3D),
      outlineVariant: Color(0xFF3D3D3D),
      shadow: shadowDark,
      scrim: shadowDark,
      inverseSurface: pureWhite,
      onInverseSurface: charcoalText,
      inversePrimary: primaryGold,
    ),
    scaffoldBackgroundColor: backgroundDark,
    cardColor: cardDark,
    dividerColor: Color(0xFF3D3D3D),

    // AppBar with dark elegance
    appBarTheme: AppBarThemeData(
      backgroundColor: surfaceDark,
      foregroundColor: textHighEmphasisDark,
      elevation: 1.0,
      shadowColor: shadowDark,
      centerTitle: true,
      titleTextStyle: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: textHighEmphasisDark,
        letterSpacing: 0.15,
      ),
      iconTheme: const IconThemeData(color: textHighEmphasisDark, size: 24),
    ),

    // Card with subtle elevation
    cardTheme: CardThemeData(
      color: cardDark,
      elevation: 2.0,
      shadowColor: shadowDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Bottom Navigation with gold accent
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceDark,
      selectedItemColor: primaryGold,
      unselectedItemColor: textMediumEmphasisDark,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 4.0,
    ),

    // FAB with emerald green
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: emeraldGreen,
      foregroundColor: backgroundDark,
      elevation: 4.0,
      shape: CircleBorder(),
    ),

    // Elevated Button with gold primary
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: backgroundDark,
        backgroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 2.0,
        shadowColor: shadowDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Outlined Button with minimal border
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: const BorderSide(color: Color(0xFF3D3D3D), width: 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Text Button with gold accent
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryGold,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
      ),
    ),

    // Typography with Playfair Display and Inter
    textTheme: _buildTextTheme(isLight: false),

    // Input decoration with focused gold border
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: surfaceDark,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF3D3D3D), width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF3D3D3D), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: primaryGold, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorRed, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: errorRed, width: 2.0),
      ),
      labelStyle: GoogleFonts.inter(
        color: textMediumEmphasisDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: GoogleFonts.inter(
        color: textDisabledDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      prefixIconColor: textMediumEmphasisDark,
      suffixIconColor: textMediumEmphasisDark,
    ),

    // Switch with gold accent
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return textMediumEmphasisDark;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold.withValues(alpha: 0.5);
        }
        return Color(0xFF3D3D3D);
      }),
    ),

    // Checkbox with gold accent
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(backgroundDark),
      side: const BorderSide(color: Color(0xFF3D3D3D), width: 2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    ),

    // Radio with gold accent
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return primaryGold;
        }
        return textMediumEmphasisDark;
      }),
    ),

    // Progress indicator with gold
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryGold,
      linearTrackColor: Color(0xFF3D3D3D),
      circularTrackColor: Color(0xFF3D3D3D),
    ),

    // Slider with gold accent
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryGold,
      thumbColor: primaryGold,
      overlayColor: primaryGold.withValues(alpha: 0.2),
      inactiveTrackColor: Color(0xFF3D3D3D),
      valueIndicatorColor: primaryGold,
      valueIndicatorTextStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Tab Bar with gold indicator
    tabBarTheme: TabBarThemeData(
      labelColor: primaryGold,
      unselectedLabelColor: textMediumEmphasisDark,
      indicatorColor: primaryGold,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
    ),

    // Tooltip with subtle styling
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: textHighEmphasisDark.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // SnackBar with elegant styling
    snackBarTheme: SnackBarThemeData(
      backgroundColor: textHighEmphasisDark,
      contentTextStyle: GoogleFonts.inter(
        color: backgroundDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      actionTextColor: primaryGold,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
    ),

    // Divider with dark border
    dividerTheme: const DividerThemeData(
      color: Color(0xFF3D3D3D),
      thickness: 1.0,
      space: 1.0,
    ),

    // Chip with dark background
    chipTheme: ChipThemeData(
      backgroundColor: cardDark,
      selectedColor: primaryGold,
      disabledColor: Color(0xFF3D3D3D),
      labelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400),
      secondaryLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: backgroundDark,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ), dialogTheme: DialogThemeData(backgroundColor: surfaceDark),
  );

  /// Helper method to build text theme based on brightness
  /// Uses Playfair Display for headings and Inter for body text
  static TextTheme _buildTextTheme({required bool isLight}) {
    final Color textHighEmphasis = isLight
        ? textHighEmphasisLight
        : textHighEmphasisDark;
    final Color textMediumEmphasis = isLight
        ? textMediumEmphasisLight
        : textMediumEmphasisDark;
    final Color textDisabled = isLight ? textDisabledLight : textDisabledDark;

    return TextTheme(
      // Display styles - Playfair Display for elegant headings
      displayLarge: GoogleFonts.playfairDisplay(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
      ),
      displaySmall: GoogleFonts.playfairDisplay(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
      ),

      // Headline styles - Playfair Display for section headers
      headlineLarge: GoogleFonts.playfairDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
      ),
      headlineMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textHighEmphasis,
      ),

      // Title styles - Inter for modern titles
      titleLarge: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
      ),

      // Body styles - Inter for extended reading
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textHighEmphasis,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textMediumEmphasis,
        letterSpacing: 0.4,
      ),

      // Label styles - Inter for UI elements
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textHighEmphasis,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textMediumEmphasis,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: textDisabled,
        letterSpacing: 0.5,
      ),
    );
  }
}
