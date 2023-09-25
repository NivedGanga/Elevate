import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String text1;
  final String text2;
  final String page;
  const Footer({
    super.key,
    required this.text1,
    required this.text2,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        TextButton(
          onPressed: () {
            //navigating to the specified page
            Navigator.of(context).pushReplacementNamed(page);
          },
          child: Text(text2),
        )
      ],
    );
  }
}
