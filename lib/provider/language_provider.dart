import 'package:back_end/shared_preferences/sharedPreferencesController.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String language = SharedPreferencesController().language;

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    SharedPreferencesController().changeLanguage(language);
    notifyListeners();
  }
}
