import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(cFullName),
                    prefixIcon: Icon(Icons.person_outline_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(cEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(cPhoneNumber),
                    prefixIcon: Icon(Icons.phone_outlined)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text(cPassword),
                    prefixIcon: Icon(Icons.lock_outlined)),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(cSignUp.toUpperCase())))
            ],
          )),
    );
  }
}