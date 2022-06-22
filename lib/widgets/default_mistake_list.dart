import 'package:flutter/material.dart';

class DefaultMistakeList extends StatelessWidget {
  const DefaultMistakeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('No mistakes found'),
    );
  }
}