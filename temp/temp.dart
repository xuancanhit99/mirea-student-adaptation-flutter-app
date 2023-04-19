import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.toggle();
  }


  void login() async {
  }

}