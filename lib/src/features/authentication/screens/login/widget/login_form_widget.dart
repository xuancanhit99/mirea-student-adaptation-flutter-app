import 'package:flutter/material.dart';

import '../../../../../constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration (
                prefixIcon: Icon(Icons.email_outlined),
                labelText: cEmail,
                // hintText: cEmail,
                border: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration (
                prefixIcon: Icon(Icons.lock_outlined),
                labelText: cPassword,
                // hintText: cEmail,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))

            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const Expanded(
                  child: Text(cRememberMe)),
              // SizedBox(width: 50,),
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, child: const Text(cForgotPassword, style: TextStyle(color: Colors.blue),))),
              ),
            ],
          ),

          SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: Text(cLogin.toUpperCase())))
        ],
      ),
    ));
  }
}