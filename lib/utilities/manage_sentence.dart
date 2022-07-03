import 'package:fix_my_english/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';

import '../style/text_style.dart';

bool dot = false;
List<Widget> getSentence({
  required String text,
  error = '',
  suggestion,
  context,
}) {
  dot = true;
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
    
    sentences.add(
      HoverAbleWidget(
          child: Wrap(
            children: [
              ...splitSentence(
                text: error,
                style: mistakeSentence,
                space: !(index == 0 || text[index - 1] != ' '),
              ),
            ],
          ),
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/mistake_icon.png",width: 60,height: 60,),
                      Expanded(
                        child: Text(suggestion,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      )
                    ],
                  ),
                  const Expanded(
                    child: Text(
                      "We will help you to solve your problem SOON",
                      style: TextStyle(fontSize: 15,color: Colors.grey),
                      
                    ),
                  )
                ],
              ),
            );
          }),
    );

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
