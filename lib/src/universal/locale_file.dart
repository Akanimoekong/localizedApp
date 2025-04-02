// locale_provider.dart
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale;

  LocaleProvider(this._locale);

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  static final supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];
}