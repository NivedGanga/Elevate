import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                height: 150.h,
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
                            borderRadius: BorderRadius.circular(50.r))),
                        backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primaryContainer,
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
              height: 15.h,
            ),
            Container(

              height: 150.h,
              child: Material(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  splashFactory: InkSparkle.splashFactory,
                  splashColor: Color.fromARGB(255, 255, 193, 212),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
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
