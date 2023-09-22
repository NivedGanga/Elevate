import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Text(
          'OR',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
        Expanded(child: Divider())
      ],
    );
  }
}
