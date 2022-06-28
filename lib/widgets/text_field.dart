import 'package:flutter/material.dart';

import '../models/controller.dart';
import '../style/fix_text_page/decorations.dart';

class MyTextField extends StatelessWidget {
  final int maxLines;
  final String? text;
  MyController? myController;
  final double borderRadius;
  MyTextField({
    this.maxLines = 10,
    this.text,
    this.myController,
    super.key,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    myController ??= MyController(TextEditingController(text: ''));

    return TextField(
      controller: myController?.controller,
      maxLines: maxLines,
      onChanged: (str) {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // filled: true,
        // fillColor: Color(0xFFF2EEE1),
        hintText: 'Enter text here...',
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 8.0,
          top: 14.0,
        ),
      ),
    );
  }
}
