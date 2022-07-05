import 'package:flutter/material.dart';

import '../models/controller.dart';
import '../style/colors.dart';
import '../style/text_style.dart';
import '../widgets/mistake_sentence.dart';
import '../widgets/my_button.dart';
import '../widgets/text_field.dart';
import 'add_report_firestore.dart';

void reportBug(MistakeSentence sentence, {required BuildContext context}) {
  // creating new sentence with small font size
  MistakeSentence smallFontSizeSentence = MistakeSentence(
    label: sentence.label,
    suggestion: sentence.suggestion,
    text: sentence.text,
    error: sentence.error,
    allTextStyle: smallAllSentence,
    mistakeTextStyle: smallMistakeSentence,
  );

  final MyController myController =
      MyController(TextEditingController(text: ''));

  showDialog(
    context: context,
    barrierColor: Colors.white60,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: backgroundReportBug,
        contentPadding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 30,
          right: 30,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        content: SizedBox(
          width: 500,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Reported mistake:'),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: 'Close',
                    icon: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(5),
                child: ListView(
                  children: [
                    smallFontSizeSentence,
                  ],
                ),
              ),
              const Text(
                  'Please tell us why you consider this mistake as a bug:'),
              MyTextField(
                filled: true,
                filledColor: Colors.white,
                maxLines: 7,
                myController: myController,
                hintText: 'Text...',
                borderRadius: 10,
              ),
              MyButton(
                onPressed: () {
                  addReport(sentence, myController.controller.text);
                  Navigator.of(context).pop();
                },
                height: 40,
                width: 160,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                color: backgroundButton,
                child: Row(
                  children: [
                    Image.asset("assets/icons/send_button.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Send report',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
