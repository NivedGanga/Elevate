import 'package:elevate/application/auth/auth_bloc.dart';
import 'package:elevate/application/otp/otp_bloc.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/infrastructure/user_details/user_details_repo.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/presentation/loginscreen/widgets/divider_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/signUp_email_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/footerWidget.dart';
import 'package:elevate/presentation/loginscreen/widgets/googleSignIn_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/otpWidget.dart';
import 'package:elevate/presentation/loginscreen/widgets/password_widget.dart';
import 'package:elevate/presentation/loginscreen/widgets/registrationButton_widget.dart';
import 'package:elevate/presentation/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final ValueNotifier<bool> _showPassword = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ValueNotifier<bool> otpSendNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              if (failure is FirebaseFailure) {
                displaySnackbar(context: context, message: failure.message);
              } else {
                displaySnackbar(
                    context: context, message: "Something went wrong");
              }
            },
            (sucess) async {
              Navigator.pushReplacementNamed(context, '/details');
            },
          ),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: BlocBuilder<OtpBloc, OtpState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            height,
                            height,
                            Image.asset("assets/login_vector-.png"),
                            height,
                            SignUpEmailFiedWidget(
                                emailController: _emailController,
                                formKey: _formKey,
                                loading: otpSendNotifier),
                            height,
                            OtpWidget(
                              otpController: _otpController,
                              formKey: _formKey,
                              otp: state.otp,
                            ),
                            height,
                            PasswordWidget(
                              showPassword: _showPassword,
                              passwordController: _passwordController,
                            ),
                            height,
                            RegistrationButtonWidget(
                              text: 'Sign Up',
                              function: () {
                                if (state.isVerified == false) {
                                  displaySnackbar(
                                      context: context,
                                      message: "Please verify your email");
                                  return;
                                }
                                if (_passwordController.text.length < 6) {
                                  displaySnackbar(
                                      context: context,
                                      message:
                                          "Password must be atleast 6 characters long");
                                  return;
                                }
                                context.read<AuthBloc>().add(AuthEvent.signUp(
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
                              text1: 'Aready have an account?',
                              text2: 'Login',
                              page: '/login',
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            state.isLoading
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                        size: 100.sp,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        );
      },
    );
  }
}
