import 'package:fix_my_english/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/mistake_sentence.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';
import '../services/api_service.dart';
import '../models/controller.dart';
import '../models/sentence.dart';
import '../widgets/mistake_list.dart';

class FixTextPage extends StatefulWidget {
  static const pageName = '/fix_text';

  // late MyController? myController;
  const FixTextPage({super.key});

  @override
  State<FixTextPage> createState() => _FixTextPageState();
}

class _FixTextPageState extends State<FixTextPage> {
  static final _sentences = [];

  void _addSentences(Sentence s) {
    setState(() {
      _sentences.add(MistakeSentence(
        text: s.text,
        suggestion: s.suggestion,
        error: s.error,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = MyController(TextEditingController(text: ''));
    if (ModalRoute.of(context)?.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as MyController;
    }
    return Scaffold(
      appBar: getAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: MistakeList(sentences: _sentences),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.bottomRight,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyTextField(
                    maxLines: 50,
                    myController: args,
                    text: args.controller.text,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      text: 'Fix',
                      onPressed: () {
                        setState(() {
                          _sentences.clear();
                        });
                        postText(
                          text: args.controller.text,
                          context: context,
                        ).then((l) {
                          l.forEach(_addSentences);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
