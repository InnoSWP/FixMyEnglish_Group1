import 'package:flutter/material.dart';

import '../style/text_style.dart';
import '../utilities/manage_sentence.dart';

class MistakeSentence extends StatelessWidget {
  final String text;
  final String error;
  final String suggestion;
  final String label;
  final TextStyle allTextStyle;
  final TextStyle mistakeTextStyle;
  const MistakeSentence({
    required this.text,
    super.key,
    this.error = '',
    required this.suggestion,
    required this.label,
    this.allTextStyle = allSentence,
    this.mistakeTextStyle = mistakeSentence,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> l = getSentence(
      text: text,
      context: context,
      error: error,
      suggestion: suggestion,
      allTextStyle: allTextStyle,
      mistakeTextStyle: mistakeTextStyle,
    );
    return Wrap(
      children: [
        ...l.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: e,
            ))
      ],
    );
  }
}
