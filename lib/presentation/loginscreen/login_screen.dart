import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            tileColor: Theme.of(context).colorScheme.primaryContainer,
            leading: Image.asset("assets/auth/google-logo-9808.png"),
            title: Text(
              "Sign in with Google",
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("button"))
        ],
      ),
    );
  }
}
