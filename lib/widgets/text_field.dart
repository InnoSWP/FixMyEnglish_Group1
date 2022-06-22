import 'package:flutter/material.dart';

import '../models/controller.dart';

class MyTextField extends StatelessWidget {
  final int maxLines;
  final String? text;
  MyController? myController;
  MyTextField({
    this.maxLines = 10,
    this.text,
    this.myController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    myController ??= MyController(TextEditingController(text: ''));

    return TextField(
      controller: myController?.controller,
      maxLines: maxLines,
      onChanged: (str) {},
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFF2EEE1),
        hintText: 'Enter text here',
        contentPadding: EdgeInsets.only(
          left: 14.0,
          bottom: 8.0,
          top: 8.0,
        ),
      ),
    );
  }
}
