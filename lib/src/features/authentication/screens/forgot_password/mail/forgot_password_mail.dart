import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
            children: [
              const SizedBox(
                height: 30 * 4,
              ),
              const FormHeaderWidget(
                image: cForgotPasswordImage,
                title: cForgotPassword,
                subtitle: cForgotPasswordSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10,),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(cEmail),
                        // hintText: cEmail,
                        prefixIcon: Icon(Icons.email_outlined)
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          Get.to(() => const OTPScreen());
                        }, child: const Text(cNext)))
                  ],
                ),
              )
            ],
        ),
      ),
          )),
    );
  }
}
