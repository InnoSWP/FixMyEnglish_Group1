import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final int maxLines;
  final String? text;
  TextEditingController? myController;
  MyTextField({this.maxLines = 10, this.text, this.myController, super.key});

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      if (myController != null) {
        myController?.text = text ?? '';
      } else {
        myController = TextEditingController(text: text);
      }
    }
    return TextField(
      controller: myController,
      maxLines: maxLines,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
