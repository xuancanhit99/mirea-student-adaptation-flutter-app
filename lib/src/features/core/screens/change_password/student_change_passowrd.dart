import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/controllers/student/student_change_password_controller.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/core/controllers/student_profile_controller.dart';

class StudentChangePasswordPage extends StatelessWidget {
  const StudentChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentChangePasswordController =
        Get.put(StudentChangePasswordController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          cChangePassword,
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
                            controller: studentChangePasswordController
                                .oldPasswordController,
                            obscureText: !studentChangePasswordController
                                .showOldPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: const Text(cOldPassword),
                                suffixIcon: IconButton(
                                  onPressed: studentChangePasswordController
                                      .toggleShowOldPassword,
                                  icon: Icon(
                                    studentChangePasswordController
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
                            controller: studentChangePasswordController
                                .newPasswordController,
                            obscureText: !studentChangePasswordController
                                .showNewPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: const Text(cNewPassword),
                                suffixIcon: IconButton(
                                  onPressed: studentChangePasswordController
                                      .toggleShowNewPassword,
                                  icon: Icon(
                                    studentChangePasswordController
                                            .showNewPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your new password';
                              } else if (studentChangePasswordController
                                      .validatePassword.value ==
                                  false) {
                                return 'New Password is not matched';
                              }
                              return null;
                            },
                          )),
                      const SizedBox(height: 10),
                      Obx(() => TextFormField(
                            controller: studentChangePasswordController
                                .reEnterNewPasswordController,
                            obscureText: !studentChangePasswordController
                                .showReEnterNewPassword.value,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                label: const Text(cReEnterNewPassword),
                                suffixIcon: IconButton(
                                  onPressed: studentChangePasswordController
                                      .toggleShowReEnterNewPassword,
                                  icon: Icon(
                                    studentChangePasswordController
                                            .showReEnterNewPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                prefixIcon: const Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please re-enter new password';
                              } else if (studentChangePasswordController
                                      .reEnterNewPasswordController.text !=
                                  studentChangePasswordController
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
                            studentChangePasswordController
                                .validatePassword.value = true;
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text("Password is matched")));
                          },
                          onFail: () {
                            studentChangePasswordController
                                .validatePassword.value = false;
                          },
                          controller: studentChangePasswordController
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
                              studentChangePasswordController.checkPassword(
                                  studentChangePasswordController
                                      .oldPasswordController.text,
                                  studentChangePasswordController
                                      .newPasswordController.text,
                                  studentChangePasswordController
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
