import 'package:flutter/material.dart';

List prohibitedSymbols = ['\n'];

/// Split [text] into small [Text] widgets by [del] delimeter.
///
/// Provide [style] to get better [TextStyle] for your widgets.
///
/// [del] - according to what split sentence, by default `' '`.
///
/// [space] - add a space to first widget or not. Helpful if [text] has some suffix of sentence.
List<Widget> splitSentence({
  required String text,
  String del = ' ',
  style,
  space = true,
}) {
  List<Widget> sentences = [];
  var splitted = text.split(del);
  for (var word in splitted) {
    // removing prohibited symbols
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
