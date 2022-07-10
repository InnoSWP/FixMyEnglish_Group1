import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constants/constants.dart';
import '../style/text_style.dart';
import '../widgets/custom_toast.dart';
import 'add_new_hoverable_widget.dart';
import 'is_mistake.dart';
import 'split_sentence.dart';

/// Converts given [text] into `List<Widget>` where hover on [error] cause [suggestion] appearance.
///
/// A valid [label] must be specified, otherwise [getSentence] will show an error.
///
/// If you will pass [error] as empty [String]. [getSentence] will consider the whole [text] as error.
/// If you will pass [error] as `null`. [getSentence] won't create any [HoverableWidget]. i.e no error exists.
///
/// To customize your text output use [mistakeTextStyle] for [erorr]
/// and [allTextStyle] for [text].
List<Widget> getSentence({
  label,
  required String text,
  String? error,
  suggestion,
  context,
  mistakeTextStyle = mistakeSentence,
  allTextStyle = allSentence,
}) {
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

  // if error is empty it mean, that all [text] has a problem
  if (error == '') {
    addHoverableWidget(
      sentences: sentences,
      error: null,
      iconInfo: iconInfo,
      index: 0,
      suggestion: suggestion,
      text: text,
      mistakeTextStyle: mistakeTextStyle,
      allTextStyle: allTextStyle,
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
        mistakeTextStyle: mistakeTextStyle,
        allTextStyle: allTextStyle,
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
