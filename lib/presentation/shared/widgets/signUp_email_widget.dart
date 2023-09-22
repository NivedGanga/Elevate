import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpEmailFiedWidget extends StatelessWidget {
  const SignUpEmailFiedWidget({
    super.key,
    required TextEditingController emailController,
    required GlobalKey<FormState> formKey,
    required bool loading,
  })  : _emailController = emailController,
        _formKey = formKey,
        _loading = loading;

  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey;
  final bool _loading;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Enter Email' : null,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          suffixIcon: TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  print('ok');
                }
              },
              child: !_loading
                  ? Text(
                      'Send OTP',
                      style: TextStyle(color: Colors.black),
                    )
                  : Container(
                      height: 80.h,
                      width: 80.w,
                      child: SpinKitRing(
                        color: Colors.lightBlue,
                      ),
                    )),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
