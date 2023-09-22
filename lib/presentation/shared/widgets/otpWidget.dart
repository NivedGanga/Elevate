import 'package:flutter/material.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    required TextEditingController otpController,
    required GlobalKey<FormState> formKey,
  }) : _otpController = otpController, _formKey = formKey;

  final TextEditingController _otpController;
  final GlobalKey<FormState> _formKey;

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
    );
  }
}