import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/presentation/shared/widgets/divider_widget.dart';
import 'package:elevate/presentation/shared/widgets/footerWidget.dart';
import 'package:elevate/presentation/shared/widgets/googleSignIn_widget.dart';
import 'package:elevate/presentation/shared/widgets/login_email-Widget.dart';
import 'package:elevate/presentation/shared/widgets/password_widget.dart';
import 'package:elevate/presentation/shared/widgets/registrationButton_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  ValueNotifier<bool> _showPassword = ValueNotifier(true);
  TextEditingController _emailController = TextEditingController();
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
              LoginEmailWidget(emailController: _emailController),
              height,
              PasswordWidget(
                  showPassword: _showPassword,
                  passwordController: _passwordController),
              height,
              RegistrationButtonWidget(
                text: 'Login', function: (){},
              ),
              height,
              DividerWidget(),
              height,
              GoogleSignInWidget(),
              height,
              Footer(
                text1: "Don't have an account?",
                text2: "Sign Up",
                page: '/signUp',
              )
            ],
          ),
        ),
      ),
    );
  }
}

