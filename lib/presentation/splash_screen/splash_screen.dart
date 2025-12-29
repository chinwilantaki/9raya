import 'package:moroccan_wedding_planner/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_export.dart';


/// Splash Screen for Moroccan Wedding Planner
/// Provides branded app launch experience with cultural design elements
/// Handles initialization and navigation logic
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;


  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _initializeApp();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Setup fade-in animation for logo
  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  /// Initialize app services and determine navigation path
  Future<void> _initializeApp() async {
    try {
      // Simulate initialization tasks
      await Future.wait([
        _loadUserPreferences(),
        _checkWeddingDataCache(),
        _prepareMultiLanguageContent(),
        _initializeDatabase(),
      ]);



      // Wait for animation to complete
      await Future.delayed(const Duration(milliseconds: 2500));

      // Navigate based on user data
      if (mounted) {
        _navigateToNextScreen();
      }
    } catch (e) {
      // Handle initialization errors gracefully
      if (mounted) {
        _navigateToNextScreen();
      }
    }
  }

  /// Load user preferences from local storage
  Future<void> _loadUserPreferences() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  /// Check if wedding data exists in cache
  Future<void> _checkWeddingDataCache() async {
    await Future.delayed(const Duration(milliseconds: 400));
  }

  /// Prepare multi-language content
  Future<void> _prepareMultiLanguageContent() async {
    await Future.delayed(const Duration(milliseconds: 350));
  }

  /// Initialize SQLite database
  Future<void> _initializeDatabase() async {
    await Future.delayed(const Duration(milliseconds: 450));
  }

  /// Navigate to appropriate screen based on user state
  void _navigateToNextScreen() {
    // For demo purposes, navigate to wedding dashboard
    // In production, check if user has existing wedding data
    Navigator.pushReplacementNamed(context, '/wedding-dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: theme.colorScheme.primary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primaryGold, AppTheme.emeraldGreen],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              _buildLogo(),
              const SizedBox(height: 48),
              _buildLoadingIndicator(),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  /// Build animated logo with Moroccan-inspired typography
  Widget _buildLogo() {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decorative Moroccan pattern icon
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.pureWhite.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CustomIconWidget(
                iconName: 'favorite',
                color: AppTheme.pureWhite,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // App name with elegant typography
          Text(
            AppLocalizations.of(context)!.splash_moroccanWedding,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: AppTheme.pureWhite,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.splash_planner,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: AppTheme.pureWhite.withValues(alpha: 0.9),
              fontWeight: FontWeight.w400,
              letterSpacing: 2.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Tagline
          Text(
            AppLocalizations.of(context)!.splash_yourPerfectCelebrationAwaits,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppTheme.pureWhite.withValues(alpha: 0.8),
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Build loading indicator with cultural styling
  Widget _buildLoadingIndicator() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(
            AppTheme.pureWhite.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}