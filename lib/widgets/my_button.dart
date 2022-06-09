import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF4D6658)),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
