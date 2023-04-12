import 'package:flutter/material.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage(cGoogleLogo),
                width: 20.0,
              ),
              onPressed: () {},
              label: Text(cSignInWithGoogle.toUpperCase())),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () {},
            child: Text.rich(TextSpan(
                text: cDoNotHaveAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                      text: cRes, style: TextStyle(color: Colors.blue))
                ])))
      ],
    );
  }
}
