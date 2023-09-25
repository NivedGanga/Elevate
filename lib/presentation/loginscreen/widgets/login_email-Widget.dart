import 'package:flutter/material.dart';

class LoginEmailWidget extends StatelessWidget {
  const LoginEmailWidget({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

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
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
