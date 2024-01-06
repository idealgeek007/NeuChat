import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/neu_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwconfirmController = TextEditingController();
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Let's get you onboard",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            NeuTextField(
              selection: true,
              hint: "Email",
              controller: _emailController,
              obscure: false,
            ),
            SizedBox(
              height: 15,
            ),
            NeuTextField(
              selection: false,
              hint: "Password",
              controller: _pwController,
              obscure: true,
            ),
            SizedBox(
              height: 15,
            ),
            NeuTextField(
              selection: false,
              hint: "Confirm Password",
              controller: _pwconfirmController,
              obscure: true,
            ),
            SizedBox(
              height: 40,
            ),
            MyButton(
              text: 'REGISTER',
              onTap: register,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void register() {}
}
