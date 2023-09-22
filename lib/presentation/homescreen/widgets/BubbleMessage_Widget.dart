import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class BubbleMessageWidget extends StatelessWidget {
  const BubbleMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: 'Hi Amigo!',
      isSender: false,
      color: Theme.of(context).colorScheme.tertiary,
      tail: true,
      textStyle: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.background),
    );
  }
}