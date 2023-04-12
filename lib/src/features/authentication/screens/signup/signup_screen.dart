import 'package:flutter/material.dart';
import 'package:misafu/src/common_widgets/form/form_header_widget.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/authentication/screens/signup/widget/signup_form_widget.dart';

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
              children: [
                const FormHeaderWidget(
                    image: cResearchImage,
                    title: cWelcomeTitle,
                    subtitle: cWelcomeSubTitle),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(cGoogleLogo),
                          width: 20,
                        ),
                        label: Text(cSignUpWithGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text.rich(TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: const [
                              TextSpan(text: cAlreadyHaveAnAccount),
                              TextSpan(
                                  text: cLogin,
                                  style: TextStyle(color: Colors.blue))
                            ])))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
