import 'package:flutter/material.dart';

import '../style/text_style.dart';
import '../utilities/manage_sentence.dart';

/// A widget that has some information about a sentence and highlights a mistake one.
///
/// [MistakeSentence] takes [text] and splits it into small parts
/// it finds errors and highlight them to [mistakeTextStyle] and make it
/// hoverable to diplay [suggestion].
/// Suggestion box has icons which depens on [label].
/// All other [text] takes [allTextStyle] style.
/// Splitting operation and searching for error done by [getSentence] function.
class MistakeSentence extends StatelessWidget {
  const MistakeSentence({
    required this.text,
    super.key,
    this.error = '',
    required this.suggestion,
    required this.label,
    this.allTextStyle = allSentence,
    this.mistakeTextStyle = mistakeSentence,
  });

  /// sentence that after some operation [MistakeSentence] returns
  final String text;

  /// Errors that should be find in [text]
  final String error;

  /// On hover on [error] in a Suggestion box show [suggestion]
  final String suggestion;

  /// Type of [error], in [MistakeSentence] used as identifier to some icons
  final String label;

  /// Text style that all [text] should have, except [error] phrases
  final TextStyle allTextStyle;

  /// Text style for [error] phrases
  final TextStyle mistakeTextStyle;

  @override
  Widget build(BuildContext context) {
    List<Widget> l = getSentence(
      label: label,
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
