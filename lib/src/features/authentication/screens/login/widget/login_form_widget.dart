import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/options/forgot_password_model_bottom_sheet.dart';
import 'package:msa/src/features/core/screens/dashboard/dashboard.dart';

import '../../../../../constants/text_strings.dart';
import '../../forgot_password/options/forgot_password_btn_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: cEmail,
                // hintText: cEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                labelText: cPassword,
                // hintText: cEmail,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(cRememberMe),
              TextButton(
                      onPressed: () {
                        ForgotPasswordScreen.buildShowModalBottomSheet(
                            context);
                      },
                      child: const Text(
                        cForgotPassword,
                        style: TextStyle(color: Colors.blue),
                      )),
              // const Expanded(child: Text(cRememberMe)),
              // // SizedBox(width: 50,),
              // Expanded(
              //   child: Align(
              //       alignment: Alignment.centerRight,
              //       child: TextButton(
              //           onPressed: () {
              //             ForgotPasswordScreen.buildShowModalBottomSheet(
              //                 context);
              //           },
              //           child: const Text(
              //             cForgotPassword,
              //             style: TextStyle(color: Colors.blue),
              //           ))),
              // ),
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const Dashboard()),
                child: Text(cLogin.toUpperCase()),
              ))
        ],
      ),
    ));
  }
}
