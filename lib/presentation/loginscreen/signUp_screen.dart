import 'dart:developer';

import 'package:elevate/presentation/shared/constants.dart';

import 'package:elevate/theme/material-theme/color_schemes.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  ValueNotifier<bool> _showPassword = ValueNotifier(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Enter Email' : null,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('ok');
                          }
                        },
                        child: Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.black),
                        )),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              height,
              TextFormField(
                validator: (value) =>
                    (_otpController.text.length < 6 ? "Enter 6 digits" : null),
                controller: _otpController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    counterText: '',
                    prefixIcon: Icon(Icons.fiber_pin_outlined),
                    suffixIcon: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('ok');
                          }
                        },
                        child: Text(
                          'Verify',
                          style: TextStyle(color: Colors.black),
                        )),
                    hintText: 'OTP',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              height,
              ValueListenableBuilder(
                  valueListenable: _showPassword,
                  builder: (context, value, Widget_) {
                    return TextFormField(
                      controller: _passwordController,
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
                        "Sign Up",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
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
                height: 15,
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
              height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Text('Login'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
