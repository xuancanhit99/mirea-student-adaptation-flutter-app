import 'package:flutter/material.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';

import '../../../../../localization/language_service.dart';

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
              FormHeaderWidget(
                image: cForgotPasswordImage,
                title: LanguageService.cForgotPassword,
                subtitle: LanguageService.cForgotPasswordSubTitle,
                crossAxisAlignment: CrossAxisAlignment.center,
                heightBetween: 30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text(LanguageService.cPhoneNo),
                          // hintText: cEmail,
                          prefixIcon: const Icon(Icons.phone_outlined)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(LanguageService.cNext)))
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
