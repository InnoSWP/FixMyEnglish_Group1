import 'package:flutter/material.dart';

import '../style/fix_text_page/colors.dart';

class DefaultMistakeList extends StatelessWidget {
  const DefaultMistakeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/default_fix_text.png"),
        const SizedBox(height: 38),
        const Text(
          'No text imported',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Eczar',
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Please add text for iExtract to check',
          style: TextStyle(
            color: noTextColor,
          ),
        ),
      ],
    );
  }
}
