import 'dart:ui';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../localization/language_service.dart';

class StudentSettingController extends GetxController {

  static StudentSettingController get instance => Get.find();

  var selectedLanguage = ''.obs;

  // final _languageKey = 'language';

  // @override
  // void onInit() {
  //   super.onInit();
  //   // initializeLanguage();
  // }
  //
  // void initializeLanguage() async {
  //   final language = await getSavedLanguage();
  //   selectedLanguage.value = language;
  //   changeLanguage();
  // }
  //
  // Future<void> saveLanguage(String lang) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_languageKey, lang);
  // }
  //
  // Future<String> getSavedLanguage() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final language = prefs.getString(_languageKey);
  //   return language ?? 'en';
  // }




  Future<void> changeLanguage() async {
       if (selectedLanguage.value == 'en') {
         Get.updateLocale(const Locale('en', 'US'));
         // await saveLanguage('en');
       } else {
         Get.updateLocale(const Locale('ru', 'RU'));
         // await saveLanguage('ru');
       }
       LanguageService.language = selectedLanguage.value;
  }

}