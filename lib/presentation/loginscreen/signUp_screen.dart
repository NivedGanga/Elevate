import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/presentation/shared/widgets/divider_widget.dart';
import 'package:elevate/presentation/shared/widgets/signUp_email_widget.dart';
import 'package:elevate/presentation/shared/widgets/footerWidget.dart';
import 'package:elevate/presentation/shared/widgets/googleSignIn_widget.dart';
import 'package:elevate/presentation/shared/widgets/otpWidget.dart';
import 'package:elevate/presentation/shared/widgets/password_widget.dart';
import 'package:elevate/presentation/shared/widgets/registrationButton_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  ValueNotifier<bool> _showPassword = ValueNotifier(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _loading = false;

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
              SignUpEmailFiedWidget(
                  emailController: _emailController,
                  formKey: _formKey,
                  loading: _loading),
              height,
              OtpWidget(otpController: _otpController, formKey: _formKey),
              height,
              PasswordWidget(
                  showPassword: _showPassword,
                  passwordController: _passwordController),
              height,
              RegistrationButtonWidget(
                text: 'Sign Up', function: (){},
              ),
              height,
              DividerWidget(),
              height,
              GoogleSignInWidget(),
              height,
              Footer(
                text1: 'Aready have an account?',
                text2: 'Login',
                page: '/login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
