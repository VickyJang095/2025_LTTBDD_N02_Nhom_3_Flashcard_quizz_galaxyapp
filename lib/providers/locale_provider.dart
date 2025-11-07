import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale;

  LocaleProvider({Locale? defaultLocale})
    : _locale = defaultLocale ?? const Locale('vi');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['en', 'vi'].contains(locale.languageCode)) return;

    if (_locale == locale) return;

    _locale = locale;
    notifyListeners();
  }
}
