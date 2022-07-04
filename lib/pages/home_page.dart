import 'dart:io';

import 'package:fix_my_english/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../style/fix_text_page/text_style.dart';
import '../widgets/custom_loading.dart';
import '../widgets/custom_toast.dart';
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
  final myController = MyController(TextEditingController());
  static final _sentences = [];

  void _addSentences(Sentence s) {
    setState(() {
      _sentences.add(MistakeSentence(
        label: s.label,
        text: s.text,
        suggestion: s.suggestion,
        error: s.error,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: MistakeList(
                        fileName: "yourFileName", sentences: _sentences),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: decorationBlocks,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MyTextField(
                          maxLines: 50,
                          myController: myController,
                          text: myController.controller.text,
                          borderRadius: 20.0,
                        ),
                        Container(
                          decoration: decorationBlocks,
                          margin: const EdgeInsets.only(bottom: 18),
                          child: MyButton(
                            onPressed: () async {
                              SmartDialog.showLoading(builder: (context) {
                                return const CustomLoading();
                              });

                              setState(() {
                                _sentences.clear();
                              });
                              try {
                                (await postText(
                                  text: myController.controller.text,
                                  context: context,
                                ))
                                    .forEach(_addSentences);
                              } catch (e) {
                                print('Error: $e');
                                SmartDialog.showToast('',
                                    alignment: Alignment.bottomCenter,
                                    builder: (context) {
                                  return const CustomToast(
                                    msg: 'Failed to fetch data from API',
                                    type: ToastType.error,
                                  );
                                });
                              }
                              SmartDialog.dismiss();
                            },
                            height: 50,
                            width: 185,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            gradient: buttonLinearGradient,
                            child: Row(
                              children: [
                                Image.asset("assets/icons/analyze_icon.png"),
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
