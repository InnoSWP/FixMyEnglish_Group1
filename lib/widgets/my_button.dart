import 'package:flutter/material.dart';

import '../style/button_styles.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const MyButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: myButtonStyle,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
