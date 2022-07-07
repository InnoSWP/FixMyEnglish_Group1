import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/text_style.dart';
import '../widgets/hoverable_widget.dart';
import 'split_sentence.dart';

/// Create a new [HoverAbleWidget] and add to [sentences]
///
/// Its takes some information about sentence like
/// [text], [error], [suggestion].
///
/// [index] - is where in [text] this [error] found.
///
/// All [addHoverableWidget] should have [iconInfo], that is displayed near [suggestion]
///
/// To customize your text output use [mistakeTextStyle] for [erorr]
/// and [allTextStyle] for [text].
void addHoverableWidget({
  required List sentences,
  text,
  error,
  suggestion,
  index,
  iconInfo,
  mistakeTextStyle = mistakeSentence,
  allTextStyle = allSentence,
}) {
  sentences.add(HoverAbleWidget(
      child: Wrap(
        children: [
          ...splitSentence(
            text: error ?? text,
            style: mistakeTextStyle,
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
