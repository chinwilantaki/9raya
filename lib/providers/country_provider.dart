import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryProvider with ChangeNotifier {
  String _selectedCountry;

  CountryProvider(this._selectedCountry);

  String get selectedCountry => _selectedCountry;

  void setCountry(String countryCode) {
    if (_selectedCountry != countryCode) {
      _selectedCountry = countryCode;
      _saveCountryToPrefs(countryCode);
      notifyListeners();
    }
  }

  Future<void> _saveCountryToPrefs(String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedCountry', countryCode);
  }

  static Future<String> getSavedCountry() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('selectedCountry') ?? 'MA'; // Default to Morocco
  }
}
