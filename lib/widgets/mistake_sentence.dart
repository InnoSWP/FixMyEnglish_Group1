import 'package:flutter/material.dart';

class MistakeSentence extends StatelessWidget {
  final String text;
  const MistakeSentence({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
