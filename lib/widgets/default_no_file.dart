import 'package:flutter/material.dart';

class DefaultNoFile extends StatelessWidget {
  final VoidCallback onPressed;
  const DefaultNoFile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset('icons/default_no_file.png'),
      ),
    );
  }
}
