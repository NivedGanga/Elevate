import 'package:elevate/application/otp/otp_bloc.dart';
import 'package:elevate/presentation/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required TextEditingController otpController,
    required GlobalKey<FormState> formKey,
    required this.otp,
  })  : _otpController = otpController,
        _formKey = formKey;

  final TextEditingController _otpController;
  final GlobalKey<FormState> _formKey;
  final int? otp;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _otpController,
      maxLength: 6,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          counterText: '',
          prefixIcon: Icon(Icons.fiber_pin_outlined),
          suffixIcon: TextButton(
              onPressed: () {
                if (!_formKey.currentState!.validate() ||
                    _otpController.text.length != 6) {
                  return;
                }
                if (otp == null) {
                  displaySnackbar(
                      context: context, message: "please get your otp first");
                  return;
                }
                print("$otp + ${_otpController.text}");
                context.read<OtpBloc>().add(OtpEvent.verifyOtp(
                    otp: otp.toString(), enteredOtp: _otpController.text));
              },
              child: BlocConsumer<OtpBloc, OtpState>(
                listener: (context, state) {
                  state.otpFailureOrSuccess.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        displaySnackbar(
                            context: context,
                            message: "Otp Verification Failed");
                      },
                      (sucess) {},
                    ),
                  );
                },
                builder: (context, state) {
                  if (state.isVerified) {
                    return Icon(
                      Icons.check,
                      color: Colors.green,
                    );
                  }
                  return Text(
                    'Verify',
                    style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  );
                },
              )),
          hintText: 'OTP',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
