import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String name;
  const TextWidget({
    super.key,
    required this.controller,
    required this.name,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: name,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
