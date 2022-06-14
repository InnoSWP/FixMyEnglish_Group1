import 'package:flutter/material.dart';

import '../style/text_style.dart';

List<Widget> getSentence({
  required String text,
  error = '',
  suggestion,
  context,
}) {
  List<Widget> sentences = [];
  if (error == '') {
    sentences.add(Tooltip(
      message: suggestion,
      // height: 20,
      padding: const EdgeInsets.all(10),
      textStyle: allSentence,
      decoration: suggestionDecoration,
      child: Text(
        text,
        style: mistakeSentence,
      ),
    ));
    return sentences;
  }
  int start = 0;
  while (true) {
    var index = text.indexOf(error, start);

    // No match found starting from $start
    if (index == -1) {
      break;
    }
    sentences.add(Text(
      text.substring(start, index),
      style: allSentence,
    ));

    sentences.add(Tooltip(
      message: suggestion,
      // height: 20,
      padding: const EdgeInsets.all(10),
      textStyle: allSentence,
      decoration: suggestionDecoration,
      child: Text(
        error,
        style: mistakeSentence,
      ),
    ));
    start = index + 1;
  }
  return sentences;
}
