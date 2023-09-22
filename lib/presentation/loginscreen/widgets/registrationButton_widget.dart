import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? function;
  const RegistrationButtonWidget({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 53,
        child: ElevatedButton(
            onPressed: function,
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r))),
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primaryContainer,
                ))));
  }
}
