import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../repository/admin_repository/admin_repository.dart';
import '../../../repository/admin_repository/admin_repository.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../utils/theme/theme.dart';
import '../../authentication/models/admin_model.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  final id = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  var img = "".obs;

  final _authAdminRepo = Get.put(AuthenticationRepository());
  final _adminRepo = Get.put(AdminRepository());


  final _themeModeKey = 'theme_mode';


  @override
  void onInit() {
    super.onInit();
    getAdminData();
    initializeTheme();
  }

  var isDarkMode = false.obs;


  void toggleDarkMode(bool value) {
    isDarkMode.toggle();
    changeTheme();
  }

  Future<void> changeTheme() async {
    if (isDarkMode.value == true) {
      Get.changeTheme(CAppTheme.darkTheme);
      await saveThemeMode(ThemeMode.dark);
    } else {
      Get.changeTheme(CAppTheme.lightTheme);
      await saveThemeMode(ThemeMode.light);
    }
  }

  void initializeTheme() async {
    final savedThemeMode = await getSavedThemeMode();
    if (savedThemeMode != ThemeMode.system) {
      isDarkMode.value = savedThemeMode == ThemeMode.dark;
      changeTheme();
    }
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
  }

  Future<ThemeMode> getSavedThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt(_themeModeKey);
    return themeModeIndex != null ? ThemeMode.values[themeModeIndex] : ThemeMode.system;
  }


  getAdminData() async {
    final uid = _authAdminRepo.firebaseUser.value?.uid;
    if (uid != null) {
      AdminModel admin = await _adminRepo.getAdminDetailsByUidAdminRepo(uid);
      id.text = admin.id!;
      fullName.text = admin.fullName;
      email.text = admin.email;
      password.text = admin.password;
      img.value = admin.img;
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }


  getAdminByUidRealtime() {
    final uid = _authAdminRepo.firebaseUser.value?.uid;
    // print(uid);
    if (uid != null) {
      return _adminRepo.getAdminDetailsByUidRealtimeAdminRepo(uid);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM d, y');
    return formatter.format(now);
  }


}
