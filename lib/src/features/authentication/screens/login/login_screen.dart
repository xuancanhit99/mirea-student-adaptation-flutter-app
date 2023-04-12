import 'package:flutter/material.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/text_strings.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import 'widget/login_footer_widget.dart';
import 'widget/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FormHeaderWidget(image: cResearchImage, title: cWelcomeTitle, subtitle: cWelcomeSubTitle),
            LoginFormWidget(),
            LoginFooterWidget(),
          ],
        ),
      ))),
    );
  }
}
