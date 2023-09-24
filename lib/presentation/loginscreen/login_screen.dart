import 'package:elevate/application/auth/auth_bloc.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/presentation/loginscreen/widgets/divider_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/footerWidget.dart';
import 'package:elevate/presentation/loginscreen/widgets/googleSignIn_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/login_email-Widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/password_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/registrationButton_widget.dart';
import 'package:elevate/presentation/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ValueNotifier<bool> _showPassword = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (failure is FirebaseFailure) {
                displaySnackbar(context: context, message: failure.message);
              } else {
                displaySnackbar(
                    context: context, message: "something went wrong");
              }
            },
            (sucess) {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        height,
                        height,
                        Image.asset("assets/signup-vector.png"),
                        height,
                        LoginEmailWidget(emailController: _emailController),
                        height,
                        PasswordWidget(
                            showPassword: _showPassword,
                            passwordController: _passwordController),
                        height,
                        RegistrationButtonWidget(
                          text: 'Login',
                          function: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              displaySnackbar(
                                  context: context,
                                  message: "Please fill all the fields");
                              return;
                            }
                            context.read<AuthBloc>().add(AuthEvent.signIn(
                                email: _emailController.text,
                                password: _passwordController.text));
                          },
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
              ),
              state.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: SpinKitWave(
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 100.sp,
                      ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
