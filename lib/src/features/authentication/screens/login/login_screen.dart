import 'package:flutter/material.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/constants/text_strings.dart';

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
        padding: const EdgeInsets.all(cDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FormHeaderWidget(
                image: cWelcomeImage,
                title: cStudentLogin,
                subtitle: '$cAppName - $cAppNameDetailed'),
            LoginFormWidget(),
            LoginFooterWidget(),
          ],
        ),
      ))),
    );
  }
}
