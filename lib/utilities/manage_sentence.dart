import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sizer/sizer.dart';

import '../widgets/hoverable_widget.dart';
import '../constants/constants.dart';
import '../style/text_style.dart';
import '../widgets/custom_toast.dart';

bool dot = false;
List<Widget> getSentence({
  label,
  required String text,
  String? error,
  suggestion,
  context,
  mistakeTextStyle = mistakeSentence,
  allTextStyle = allSentence,
}) {
  dot = true;
  List<Widget> sentences = [];
  if (!labelToIconAsset.containsKey(label)) {
    SmartDialog.showToast(
      '',
      alignment: Alignment.bottomCenter,
      builder: (context) => const CustomToast(
        msg: 'Can\'t find provided label!',
        type: ToastType.error,
      ),
    );
    return sentences;
  }
  var iconInfo = labelToIconAsset[label];
  if (error == '') {
    addHoverableWidget(
      sentences: sentences,
      error: null,
      iconInfo: iconInfo,
      index: 0,
      suggestion: suggestion,
      text: text,
    );

    return sentences;
  }
  int start = 0;
  while (true && error != null) {
    var index = text.indexOf(error, start);

    // No match found starting from $start
    if (index == -1) {
      break;
    }

    if (isMistake(
        text: text, error: error, index: index, suggestion: suggestion)) {
      sentences.addAll(
        splitSentence(
          text: text.substring(start, index),
          style: allTextStyle,
          space: (start != 0),
        ),
      );
      addHoverableWidget(
        sentences: sentences,
        error: error,
        iconInfo: iconInfo,
        index: index,
        suggestion: suggestion,
        text: text,
      );
    } else {
      sentences.addAll(
        splitSentence(
          text: text.substring(start, index + error.length),
          style: allTextStyle,
          space: !(start == 0 || text[start - 1] != ' '),
        ),
      );
    }

    start = index + error.length;
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

void addHoverableWidget({
  required List sentences,
  text,
  error,
  suggestion,
  index,
  iconInfo,
}) {
  sentences.add(HoverAbleWidget(
      child: Wrap(
        children: [
          ...splitSentence(
            text: error ?? text,
            style: mistakeSentence,
            space: !(index == 0 || text[index - 1] != ' '),
          ),
        ],
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(
                    iconInfo!["link"] as String,
                    height: (iconInfo["height"] as double).h,
                    width: (iconInfo["width"] as double).w,
                  ),
                  Expanded(
                    child: Text(suggestion,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  )
                ],
              ),
              const Expanded(
                child: Text(
                  "We will help you to solve your problem SOON",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),
        );
      }));
}

bool isMistake({
  text,
  error,
  index,
  suggestion,
}) {
  int sLength = text.length;
  int lastSymbol = index + (error.length); // not including last)
  if (index == 0 && lastSymbol == sLength) {
    // [error]
    return true;
  } else if (index == 0 && !isLetter(text[lastSymbol])) {
    // [error text]
    return true;
  } else if (index == 0 && suggestion == 'Using contractions') {
    // [error[n't]]
    return true;
  } else if (index > 0 &&
      lastSymbol == sLength &&
      !isLetter(text[index - 1])) {
    // [ error]
    return true;
  } else if (index > 0 &&
      lastSymbol == sLength &&
      suggestion == 'Using contractions') {
    // [[n't]error]
    return true;
  } else if (index > 0 &&
      lastSymbol < sLength &&
      !isLetter(text[lastSymbol])) {
    // [text error text]
    return true;
  } else if (index > 0 &&
      lastSymbol < sLength &&
      suggestion == 'Using contractions') {
    // [text errorn't text]
    return true;
  }
  return false;
}

bool isLetter(String s) {
  if (s.length != 1) {
    return false;
  }
  int c = s.codeUnitAt(0);
  return (c >= 0x41 && c <= 0x5A) || (c >= 0x61 && c <= 0x7A);
}
