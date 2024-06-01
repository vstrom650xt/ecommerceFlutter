import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('en');

  Locale get currentLocale => _currentLocale;

  void toggleLanguage() {
    if (_currentLocale.languageCode == 'en') {
      _currentLocale = const Locale('es');
    } else {
      _currentLocale = const Locale('en');
    }
    notifyListeners();
  }
}

class ProvidersAuth extends StatelessWidget {
  final Widget child;

  const ProvidersAuth({required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
      create: (_) => LanguageProvider(),
      child: child,
    );
  }
}
