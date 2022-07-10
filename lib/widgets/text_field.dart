import 'package:flutter/material.dart';

import '../models/controller.dart';

/// A widget to display a custom [TextField].
///
/// [MyTextField] accepts [text] and [myController] to display default text in [MyTextField].
/// if [myController] is null, it tries to take text from [text], which is by deafult empty [String].
class MyTextField extends StatelessWidget {
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

  /// Text to place inside [MyTextField] by deafult.
  final String? text;

  /// Border radius of [MyTextField].
  final double borderRadius;

  /// Controller of [MyTextField].
  ///
  /// if its null there are will be created new [myController] with [text] inside of it.
  final MyController? myController;

  final int maxLines;
  final bool? filled;
  final Color? filledColor;
  final String hintText;
  final bool readOnly;

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
