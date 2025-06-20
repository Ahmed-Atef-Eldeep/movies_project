import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String currentLocale = 'en';

  void changeLanguage(String newLocale) {
    if (currentLocale == newLocale) {
      return; // No change needed
    }
    currentLocale = newLocale;
    notifyListeners();
  }
}
