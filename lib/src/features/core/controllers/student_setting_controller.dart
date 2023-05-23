import 'package:get/get.dart';

class StudentSettingController extends GetxController {
  var selectedLanguage = 'english'.obs;

  void changeLanguage(String languageCode) {
    selectedLanguage.value = languageCode;
  }

  String get currentLanguage => selectedLanguage.value;


  // void selectLanguage(String language) {
  //   selectedLanguage.value = language;
  //   // Get.snackbar("ABC", selectedLanguage.value.toString());
  // }

 // void checkLanguage() {
 //    if (selectedLanguage.value == 'english') {
 //      Get.updateLocale(Locale('en', 'US'));
 //    } else {
 //      Get.updateLocale(Locale('ru', 'RU'));
 //    }
 //  }


  // void checkLanguage() {
  //   Get.snackbar("abc", selectedLanguage.value.toString());
  // }
}