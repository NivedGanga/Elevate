import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.amber,
        child: Center(child: Text('Story')),
      ),
    );
  }
}
