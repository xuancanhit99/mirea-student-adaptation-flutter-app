import 'package:flutter/material.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/text_strings.dart';

import 'widget/login_footer_widget.dart';
import 'widget/login_form_widget.dart';
import 'widget/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeaderWidget(height: height, width: width),
            const LoginForm(),
            const LoginFooterWidget(),
          ],
        ),
      ))),
    );
  }
}
