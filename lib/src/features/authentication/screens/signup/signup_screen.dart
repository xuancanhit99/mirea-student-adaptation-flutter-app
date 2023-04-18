import 'package:flutter/material.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/screens/signup/widget/signup_footer_widget.dart';
import 'package:msa/src/features/authentication/screens/signup/widget/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: const [
                FormHeaderWidget(
                    image: cResearchImage,
                    title: cWelcomeTitle,
                    subtitle: cWelcomeSubTitle),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
