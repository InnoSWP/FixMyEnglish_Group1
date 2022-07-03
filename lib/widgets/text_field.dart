import 'package:flutter/material.dart';

import '../models/controller.dart';

class MyTextField extends StatelessWidget {
  final int maxLines;
  final String? text;
  final MyController? myController;
  final double borderRadius;
  final bool? filled;
  final Color? filledColor;
  final String hintText;
  final bool readOnly;
  const MyTextField({
    this.maxLines = 10,
    this.text = '',
    this.myController,
    super.key,
    this.borderRadius = 0,
    this.filled,
    this.filledColor,
    this.hintText = 'Enter text here...',
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final initMyController =
        myController ?? MyController(TextEditingController(text: text));

    return TextField(
      readOnly: readOnly,
      controller: initMyController.controller,
      maxLines: maxLines,
      onChanged: (str) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        filled: filled,
        fillColor: filledColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 8.0,
          top: 14.0,
        ),
      ),
    );
  }
}
