import 'package:flutter/material.dart';

class DefaultFileList extends StatelessWidget {
  const DefaultFileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('Files not found, please add them'),
    );
  }
}
