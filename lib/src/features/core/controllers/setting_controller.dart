import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../localization/language_service.dart';

class SettingController extends GetxController {

  static SettingController get instance => Get.find();

  var selectedLanguage = ''.obs;

  final _selectedLanguageKey = 'selected_language';

  @override
  Future<void> onInit() async {
    super.onInit();
    // Set language on start
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedLanguage = prefs.getString(_selectedLanguageKey);
    if (storedLanguage != null) {
      selectedLanguage.value = storedLanguage;
      if (storedLanguage == 'en') {
        Get.updateLocale(const Locale('en', 'US'));
      } else if (storedLanguage == 'ru') {
        Get.updateLocale(const Locale('ru', 'RU'));
      }
      LanguageService.language = selectedLanguage.value;
    }
  }

  Future<void> changeLanguage() async {
       if (selectedLanguage.value == 'en') {
         Get.updateLocale(const Locale('en', 'US'));
       } else if (selectedLanguage.value == 'ru') {
         Get.updateLocale(const Locale('ru', 'RU'));
       }
       // else {
       //   selectedLanguage.value = 'en';
       // }
       SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setString(_selectedLanguageKey, selectedLanguage.value);
       LanguageService.language = selectedLanguage.value;
  }

}