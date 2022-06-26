import 'package:fix_my_english/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../style/fix_text_page/text_style.dart';
import '../widgets/mistake_sentence.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';
import '../services/api_service.dart';
import '../models/controller.dart';
import '../models/sentence.dart';
import '../widgets/mistake_list.dart';
import '../style/colors.dart';
import '../style/fix_text_page/decorations.dart';
import '../style/fix_text_page/button_style.dart';

class HomePage extends StatefulWidget {
  static const pageName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: getAppBar(actions: true),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Divider(color: colorPrimaryRedCaramel, height: 3),
          const Divider(color: colorPrimaryRedCaramel, height: 5),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    decoration: decorationBlocks,
                    child: MistakeList(sentences: _sentences),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: decorationBlocks,
                    // alignment: Alignment.topCenter,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyTextField(
                          maxLines: 50,
                          myController: args,
                          text: args.controller.text,
                          borderRadius: 20.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 18),
                          child: MyButton(
                            onPressed: () {
                              setState(() {
                                _sentences.clear();
                              });
                              postTextSample(
                                text: args.controller.text,
                                context: context,
                              ).then((l) {
                                l.forEach(_addSentences);
                              });
                            },
                            height: 50,
                            width: 185,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            gradient: buttonLinearGradient,
                            child: Row(
                              children: [
                                Image.asset('icons/analyze_icon.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Analyse text',
                                  style: analyzeButton,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
