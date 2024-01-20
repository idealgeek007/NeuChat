import 'package:flutter/material.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../components/my_button.dart';
import '../components/neu_textfield.dart';
import '../services/authentication/auth_service.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwconfirmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Neumorphic(
              child: Image.asset('assets/logo.png'),
              style: NeumorphicStyle(
                  color: Theme.of(context).colorScheme.background),
            ),
            SizedBox(
              height: 50,
            ),
            NeumorphicText(
              "Let's get you onboard",
              textStyle: NeumorphicTextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500),
              style: NeumorphicStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            NeuTextField(
              selection: true,
              hint: "Name",
              controller: _nameController,
              obscure: false,
            ),
            SizedBox(
              height: 15,
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
              onTap: () => register(context),
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
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Login now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // If passwords match ->Create user

    if (_pwController.text == _pwconfirmController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text, _nameController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    // Passwords dont match
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords don't match!"),
              ));
    }
  }
}
