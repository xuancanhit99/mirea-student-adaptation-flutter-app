import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misafu/src/features/authentication/controllers/signup_controller.dart';
import 'package:misafu/src/features/authentication/models/student_model.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/otp_controller.dart';
import '../../forgot_password/otp/otp_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(cFullName),
                    prefixIcon: Icon(Icons.person_outline_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(cEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(cPhoneNo),
                    prefixIcon: Icon(Icons.phone_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(cPassword),
                    prefixIcon: Icon(Icons.lock_outlined)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                          // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                          // Get.to(() => const OTPScreen());
                          final student = StudentModel(
                              email: controller.email.text.trim(),
                              password: controller.password.text.trim(),
                              fullName: controller.fullName.text.trim(),
                              phoneNo: controller.phoneNo.text.trim());

                          SignUpController.instance.createStudent(student);

                        }
                      },
                      child: Text(cSignUp.toUpperCase())))
            ],
          )),
    );
  }
}