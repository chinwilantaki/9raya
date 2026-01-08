import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_app_bar.dart';

/// Language Selection Screen
/// Allows users to select their preferred language for the app
class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  static const Map<String, Map<String, String>> availableLanguages = {
    'en': {
      'name': 'English',
      'nativeName': 'English',
      'code': 'en',
      'flag': '🇬🇧',
    },
    'fr': {
      'name': 'French',
      'nativeName': 'Français',
      'code': 'fr',
      'flag': '🇫🇷',
    },
    'ar': {
      'name': 'Arabic',
      'nativeName': 'العربية',
      'code': 'ar',
      'flag': '🇸🇦',
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final appLocalizations = AppLocalizations.of(context);
    final currentLocale = localeProvider.locale.languageCode;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBar.standard(
        title: appLocalizations?.languageSelection_selectLanguage ?? 'Select Language',
        actions: [
          CustomAppBarAction(
            icon: Icons.check,
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    appLocalizations?.languageSelection_languageUpdated ?? 'Language updated',
                  ),
                ),
              );
            },
            tooltip: appLocalizations?.common_confirm ?? 'Confirm',
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.w),
        itemCount: availableLanguages.length,
        itemBuilder: (context, index) {
          final languageCode = availableLanguages.keys.elementAt(index);
          final language = availableLanguages[languageCode]!;
          final isSelected = languageCode == currentLocale;

          return Card(
            margin: EdgeInsets.only(bottom: 2.h),
            elevation: isSelected ? 4 : 1,
            color: isSelected
                ? theme.colorScheme.primaryContainer
                : theme.cardColor,
            child: ListTile(
              leading: CircleAvatar(
                radius: 3.h,
                backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                child: Text(
                  language['flag']!,
                  style: TextStyle(fontSize: 4.h),
                ),
              ),
              title: Text(
                language['nativeName']!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : null,
                ),
              ),
              subtitle: Text(
                language['name']!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.7)
                      : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              trailing: isSelected
                  ? Icon(
                      Icons.check_circle,
                      color: theme.colorScheme.primary,
                    )
                  : Icon(
                      Icons.radio_button_unchecked,
                      color: theme.colorScheme.outline,
                    ),
              onTap: () {
                localeProvider.setLocale(Locale(languageCode));
              },
            ),
          );
        },
      ),
    );
  }
}
