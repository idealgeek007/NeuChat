import 'package:flutter/material.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/neu_textfield.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

import '../services/authentication/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});
  void login(BuildContext context) async {
    // get auth service
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

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
              "Hey!! There You are,Welcome back",
              textStyle: NeumorphicTextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500),
              style: NeumorphicStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
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
              height: 50,
            ),
            MyButton(
              text: 'LOGIN',
              onTap: () => login(context),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New here? Let\'s change that! ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register now',
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
}
