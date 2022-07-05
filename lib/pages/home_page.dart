import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../style/fix_text_page/colors.dart';
import '../utilities/analyse_text_button.dart';
import '../widgets/text_field.dart';
import '../style/fix_text_page/text_style.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';
import '../models/controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(actions: true),
      backgroundColor: backgroundPageColor,
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
                      fileName: defaultFileName,
                      sentences: _sentences,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: decorationBlocks,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MyTextField(
                          maxLines: 50,
                          myController: myController,
                          borderRadius: 20.0,
                        ),
                        Container(
                          decoration: decorationBlocks,
                          margin: const EdgeInsets.only(bottom: 18),
                          child: MyButton(
                            onPressed: () async {
                              await analyseTextButton(
                                context: context,
                                myController: myController,
                                sentences: _sentences,
                              );
                              setState(() {});
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
