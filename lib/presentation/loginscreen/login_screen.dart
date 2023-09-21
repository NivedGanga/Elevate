import 'dart:developer';

import 'package:elevate/infrastructure/auth/auth_repo.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  ValueNotifier<bool> _showPassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            height,
            ValueListenableBuilder(
                valueListenable: _showPassword,
                builder: (context, value, Widget_) {
                  return TextFormField(
                    obscureText: value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _showPassword.value = !_showPassword.value;
                            },
                            icon: Icon(value
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  );
                }),
            height,
            SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.tertiaryContainer,
                        )))),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(
                  'OR',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                Expanded(child: Divider())
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 53,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      await AuthRepo().sendOtp("nivedlss4242@gmail.com");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image(
                                image: AssetImage(
                                    'assets/auth/google-logo-9808.png'),
                              ),
                            ),
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(fontSize: 18),
                          ),
                          Expanded(
                            child: SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
