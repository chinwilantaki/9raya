import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../data/wedding_traditions_data.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/country_provider.dart';
import '../../providers/locale_provider.dart';
import '../../widgets/custom_app_bar.dart';

/// Country Selection Screen
/// Allows users to select their country to view relevant wedding traditions
class CountrySelection extends StatefulWidget {
  const CountrySelection({super.key});

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final countryProvider = Provider.of<CountryProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final currentLocale = localeProvider.locale.languageCode;
    
    final availableCountries = WeddingTraditionsData.getAvailableCountries();
    final selectedCountry = countryProvider.selectedCountry;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBar.standard(
        title: AppLocalizations.of(context)?.countrySelection_selectCountry ?? 'Select Country',
        actions: [
          if (selectedCountry.isNotEmpty)
            CustomAppBarAction(
              icon: Icons.check,
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)?.countrySelection_countryUpdated ?? 'Country updated! Traditions have been updated.',
                    ),
                  ),
                );
              },
              tooltip: AppLocalizations.of(context)?.countrySelection_confirmSelection ?? 'Confirm selection',
            ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(4.w),
        itemCount: availableCountries.length,
        itemBuilder: (context, index) {
          final country = availableCountries[index];
          final isSelected = country['code'] == selectedCountry;
          
          String countryName;
          switch (currentLocale) {
            case 'fr':
              countryName = country['nameFr']!;
              break;
            case 'ar':
              countryName = country['nameAr']!;
              break;
            default:
              countryName = country['name']!;
          }

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
                  country['flag']!,
                  style: TextStyle(fontSize: 4.h),
                ),
              ),
              title: Text(
                countryName,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : null,
                ),
              ),
              subtitle: Text(
                country['name']!, // Show English name as subtitle
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
                countryProvider.setCountry(country['code']!);
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
