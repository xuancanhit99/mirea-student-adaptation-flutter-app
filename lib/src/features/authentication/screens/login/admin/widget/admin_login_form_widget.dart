import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/options/forgot_password_model_bottom_sheet.dart';

import '../../../../../../constants/text_strings.dart';
import '../../../../controllers/admin/admin_login_controller.dart';
import '../../../../controllers/student/student_login_controller.dart';


class AdminLoginFormWidget extends StatelessWidget {
  const AdminLoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(AdminLoginController());
    final formKey = GlobalKey<FormState>();
    return Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email
              TextFormField(
                controller: loginController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: cEmail,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!EmailValidator.validate(value, true)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Password
              Obx(
                () => TextFormField(
                  controller: loginController.passwordController,
                  obscureText: !loginController.showPassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outlined),
                      labelText: cPassword,
                      suffixIcon: IconButton(
                        onPressed: loginController.toggleShowPassword,
                        icon: Icon(
                          loginController.showPassword.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              // Remember me and forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Add checkbox remember me
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          checkColor: Theme.of(context).colorScheme.surface,
                          activeColor: Theme.of(context).colorScheme.onSurface,
                          value: loginController.rememberMe.value,
                          onChanged: (bool? value) {
                            loginController.rememberMe.value = value ?? false;
                            if (loginController.rememberMe.value) {
                              loginController.emailController.text.trim();
                              loginController.passwordController.text.trim();
                            }
                          },
                        ),
                      ),
                      const Text(cRememberMe),
                    ],
                  ),
                  // Add forgot password
                  TextButton(
                      onPressed: () {
                        ForgotPasswordScreen.buildShowModalBottomSheet(context);
                      },
                      child: const Text(
                        cForgotPassword,
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        loginController.loginAdmin(
                            loginController.emailController.text.trim(),
                            loginController.passwordController.text.trim());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(cLogin.toUpperCase()),
                  ))
            ],
          ),
        ));
  }
}
