import 'package:flutter/material.dart';
import 'package:misafu/src/common_widgets/form/form_header_widget.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/text_strings.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

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
                  const SizedBox(height: 10,),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              label: Text(cPhoneNo),
                              // hintText: cEmail,
                              prefixIcon: Icon(Icons.phone_outlined)
                          ),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(onPressed: () {}, child: const Text(cNext)))
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
