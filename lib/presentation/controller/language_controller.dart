import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

@injectable
class LanguageController extends ChangeNotifier {
  Locale _current = const Locale('en');
  List<Locale> _supported = const [Locale('en'), Locale('fr')];

  Locale get current => _current;
  List<Locale> get supported => _supported;

  /// Charge les valeurs depuis le contexte actuel
  void loadFromContext(BuildContext context) {
    _current = context.locale;
    _supported = context.supportedLocales;
    notifyListeners();
  }

  /// Met à jour la langue actuelle + contextuel + UI
  Future<void> setLanguage(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
    _current = locale;
    notifyListeners();
  }
}
