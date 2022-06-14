import 'package:flutter/material.dart';

import '../utilities/manage_sentence.dart';

class MistakeSentence extends StatelessWidget {
  final String text;
  final String error;
  final String suggestion;
  const MistakeSentence({
    required this.text,
    super.key,
    this.error = '',
    required this.suggestion,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> l = getSentence(
      text: text,
      context: context,
      error: error,
      suggestion: suggestion,
    );
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...l.map((e) => Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
              child: e,
            ))
      ],
    );
  }
}
