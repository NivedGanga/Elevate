import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? function;
  final String name;
  const SubmitButton({super.key, required this.function, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 53,
        child: ElevatedButton(
            onPressed: function,
            child: Text(
              name,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18),
            ),
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r))),
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primaryContainer,
                ))));
  }
}
