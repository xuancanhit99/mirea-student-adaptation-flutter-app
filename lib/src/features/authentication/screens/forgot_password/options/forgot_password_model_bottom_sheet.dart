import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/common_widgets/page_not_found/page_not_found1.dart';

import '../../../../../localization/language_service.dart';
import '../mail/forgot_password_mail.dart';
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
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageService.cForgotPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(LanguageService.cForgotPasswordSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(
                    height: 30,
                  ),
                  ForgotPasswordBtnWidget(
                    btnIcon: Icons.mail_outlined,
                    title: LanguageService.cEmail,
                    subTitle: LanguageService.cResetViaEmail,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ForgetPasswordMailScreen());
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgotPasswordBtnWidget(
                    btnIcon: Icons.mobile_friendly_outlined,
                    title: LanguageService.cPhoneNo,
                    subTitle: LanguageService.cResetViaPhone,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const PageNotFound1());
                    },
                  ),
                ],
              ),
            ));
  }
}
