import 'package:elevate/application/otp/otp_bloc.dart';
import 'package:elevate/presentation/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpEmailFiedWidget extends StatelessWidget {
  const SignUpEmailFiedWidget({
    super.key,
    required TextEditingController emailController,
    required GlobalKey<FormState> formKey,
    required ValueNotifier loading,
  })  : _emailController = emailController,
        _formKey = formKey,
        _loading = loading;

  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey;
  final ValueNotifier _loading;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //validating email
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Enter Email' : null,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          suffixIcon: ValueListenableBuilder(
              valueListenable: _loading,
              builder: (context, value, child) {
                return BlocListener<OtpBloc, OtpState>(
                  listener: (context, state) {
                    state.otpFailureOrSuccess.fold(
                      () {},
                      (either) => either.fold(
                        (failure) {
                          //if failure is firebase failure then display the message
                          _loading.value = false;

                          displaySnackbar(
                              context: context, message: "Otp Sending Failed");
                        },
                        (sucess) {
                          //if otp is verified then display check icon
                          _loading.value = false;
                        },
                      ),
                    );
                  },
                  child: TextButton(
                      onPressed: () async {
                        //if form is not valid then return
                        if (!(_formKey.currentState!.validate())) {
                          return;
                        }
                 
                        _loading.value = true;
                        //sending otp
                        context.read<OtpBloc>().add(OtpEvent.sendOtp(
                            recipienEmail: _emailController.text));
                      },
                      child: !value
                          ? Text(
                              'Send OTP',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            )
                          : Container(
                              height: 80.h,
                              width: 80.w,
                              child: SpinKitRing(
                                color: Colors.lightBlue,
                              ),
                            )),
                );
              }),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
