import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/features/authentication/controllers/student/student_change_password_controller.dart';

import '../../../../../localization/language_service.dart';

class AdminChangePasswordPage extends StatelessWidget {
  const AdminChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminChangePasswordController =
        Get.put(StudentChangePasswordController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          LanguageService.cChangePassword,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Obx(() => TextFormField(
                            controller: adminChangePasswordController
                                .oldPasswordController,
                            obscureText: !adminChangePasswordController
                                .showOldPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: Text(LanguageService.cOldPassword),
                                suffixIcon: IconButton(
                                  onPressed: adminChangePasswordController
                                      .toggleShowOldPassword,
                                  icon: Icon(
                                    adminChangePasswordController
                                            .showOldPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your old password';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(height: 10),
                      Obx(() => TextFormField(
                            controller: adminChangePasswordController
                                .newPasswordController,
                            obscureText: !adminChangePasswordController
                                .showNewPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: Text(LanguageService.cNewPassword),
                                suffixIcon: IconButton(
                                  onPressed: adminChangePasswordController
                                      .toggleShowNewPassword,
                                  icon: Icon(
                                    adminChangePasswordController
                                            .showNewPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your new password';
                              } else if (adminChangePasswordController
                                      .validatePassword.value ==
                                  false) {
                                return 'New Password is not matched';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(height: 10),
                      Obx(() => TextFormField(
                            controller: adminChangePasswordController
                                .reEnterNewPasswordController,
                            obscureText: !adminChangePasswordController
                                .showReEnterNewPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label:
                                    Text(LanguageService.cReEnterNewPassword),
                                suffixIcon: IconButton(
                                  onPressed: adminChangePasswordController
                                      .toggleShowReEnterNewPassword,
                                  icon: Icon(
                                    adminChangePasswordController
                                            .showReEnterNewPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please re-enter new password';
                              } else if (adminChangePasswordController
                                      .reEnterNewPasswordController.text !=
                                  adminChangePasswordController
                                      .newPasswordController.text) {
                                return 'Re-enter new password must be the same as new password';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FlutterPwValidator(
                          width: 400,
                          height: 150,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          numericCharCount: 1,
                          specialCharCount: 1,
                          onSuccess: () {
                            adminChangePasswordController
                                .validatePassword.value = true;
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text("Password is matched")));
                          },
                          onFail: () {
                            adminChangePasswordController
                                .validatePassword.value = false;
                          },
                          controller: adminChangePasswordController
                              .newPasswordController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Update button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              adminChangePasswordController.checkPassword(
                                  adminChangePasswordController
                                      .oldPasswordController.text,
                                  adminChangePasswordController
                                      .newPasswordController.text,
                                  adminChangePasswordController
                                      .reEnterNewPasswordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            "Update",
                            style: TextStyle(color: cDarkColor),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
