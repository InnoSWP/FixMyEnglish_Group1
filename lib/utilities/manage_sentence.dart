import 'package:flutter/material.dart';

import '../style/text_style.dart';

bool dot = false;
List<Widget> getSentence({
  required String text,
  error = '',
  suggestion,
  context,
  mistakeTextStyle = mistakeSentence,
  allTextStyle = allSentence,
}) {
  dot = true;
  List<Widget> sentences = [];
  if (error == '') {
    sentences.add(Tooltip(
      message: suggestion,
      // height: 20,
      padding: const EdgeInsets.all(10),
      textStyle: allTextStyle,
      decoration: suggestionDecoration,
      child: Wrap(
        children: [
          ...splitSentence(
            text: text,
            style: mistakeTextStyle,
            space: false,
          ),
        ],
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

    sentences.addAll(
      splitSentence(
        text: text.substring(start, index),
        style: allTextStyle,
        space: (start != 0),
      ),
    );

    sentences.add(Tooltip(
      message: suggestion,
      // height: 20,
      padding: const EdgeInsets.all(10),
      textStyle: allTextStyle,
      decoration: suggestionDecoration,
      child: Wrap(
        children: [
          ...splitSentence(
            text: error,
            style: mistakeTextStyle,
            space: !(index == 0 || text[index - 1] != ' '),
          ),
        ],
      ),
    ));

    // sentences.add(
    //   Text(
    //     error,
    //     style: mistakeSentence,
    //     overflow: TextOverflow.ellipsis,
    //   ),
    // );

    start = index + (error.length as int);
  }
  if (start < text.length) {
    sentences.addAll(splitSentence(
      text: text.substring(start),
      style: allTextStyle,
      space: !(start == 0 || text[start - 1] != ' '),
    ));
  }
  return sentences;
}

List prohibitedSymbols = ['\n'];
List<Widget> splitSentence({
  required String text,
  String del = ' ',
  style,
  space = true,
}) {
  List<Widget> sentences = [];
  var splitted = text.split(del);
  for (var word in splitted) {
    // clearing prohibited symbols
    for (var c in prohibitedSymbols) {
      word = word.replaceAll(c, '');
    }

    sentences.add(Text(
      (dot ? '• ' : (space ? ' ' : '')) + word,
      style: style,
    ));
    space = true;
    dot = false;
  }

  return sentences;
}
