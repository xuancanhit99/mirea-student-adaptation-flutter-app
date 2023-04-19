import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/options/forgot_password_model_bottom_sheet.dart';
import 'package:msa/src/features/core/screens/dashboard/dashboard.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/login_controller.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
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
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: cEmail,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
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
                      )),
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
                      Checkbox(
                        checkColor: Theme.of(context).colorScheme.surface,
                        activeColor: Theme.of(context).colorScheme.onSurface,
                        value: true,
                        onChanged: (bool? value) {},
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
                        loginController.login();
                        Get.to(() => const Dashboard());
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
