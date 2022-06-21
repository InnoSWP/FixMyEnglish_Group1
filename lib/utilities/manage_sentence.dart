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
      child: Wrap(
        children: [
          ...splitSentence(
            text: text,
            style: mistakeSentence,
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
        style: allSentence,
        space: (start != 0),
      ),
    );

    sentences.add(Tooltip(
      message: suggestion,
      // height: 20,
      padding: const EdgeInsets.all(10),
      textStyle: allSentence,
      decoration: suggestionDecoration,
      child: Wrap(
        children: [
          ...splitSentence(
            text: error,
            style: mistakeSentence,
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
      style: allSentence,
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
    for (var c in prohibitedSymbols) {
      word = word.replaceAll(c, '');
    }
    sentences.add(Text(
      (space ? ' ' : '') + word,
      style: style,
    ));
    space = true;
  }

  return sentences;
}
