import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({
    super.key,
    required ValueNotifier<bool> showPassword,
    required TextEditingController passwordController,
  })  : _showPassword = showPassword,
        _passwordController = passwordController;

  final ValueNotifier<bool> _showPassword;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
                    icon:
                        Icon(value ? Icons.visibility_off : Icons.visibility)),
                hintText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          );
        });
  }
}
