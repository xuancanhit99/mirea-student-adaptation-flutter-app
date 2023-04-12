import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/text_strings.dart';
import '../mail/forgot_password_mail.dart';
import '../phone/forgot_password_phone.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Theme.of(context).splashColor,
        context: context,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20)
        // ),
        builder: (context) => Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                cForgotPasswordTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium,
              ),
              Text(cForgotPasswordSubTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium),
              const SizedBox(
                height: 30,
              ),
              ForgotPasswordBtnWidget(
                btnIcon: Icons.mail_outlined,
                title: cEmail,
                subTitle: cResetViaEmail,
                onTap: (){
                  Navigator.pop(context);
                  Get.to(() => const ForgetPasswordMailScreen());
                  },
              ),
              const SizedBox(
                height: 20,
              ),
              ForgotPasswordBtnWidget(
                btnIcon: Icons.mobile_friendly_outlined,
                title: cPhoneNo,
                subTitle: cResetViaPhone,
                onTap: (){
                  Navigator.pop(context);
                  Get.to(() => const ForgetPasswordPhoneScreen());
                },
              ),
            ],
          ),
        ));
  }
}