import 'package:flutter/material.dart';

class RestartButtonWidget extends StatelessWidget {
  const RestartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton.extended(
          onPressed: () {}, label: Icon(Icons.restart_alt)),
    );
  }
}
