import 'package:fix_my_english/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/mistake_sentence.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';
import '../widgets/my_button.dart';
import '../models/simple_dialog.dart';

class FixTextPage extends StatelessWidget {
  final TextEditingController? myController;
  const FixTextPage({super.key, this.myController});

  @override
  Widget build(BuildContext context) {
    var args = '';
    if (ModalRoute.of(context)!.settings.arguments != null) {
      args = ModalRoute.of(context)!.settings.arguments as String;
    }

    return Scaffold(
      appBar: getAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  // alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  color: colorSecondaryLightGreenPlant,
                  // padding: const EdgeInsets.all(10),
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.blueAccent),
                  // ),
                  child: ListView(
                    children: const [
                      MistakeSentence(
                        text: 'some text with mistake1',
                        error: 'mistake1',
                        suggestion: 'sug1',
                      ),
                      MistakeSentence(
                        text: 'some text with mistake2',
                        error: 'mistake2',
                        suggestion: 'sug2',
                      ),
                      MistakeSentence(
                        text: 'some text with mistake3',
                        error: 'mistake3',
                        suggestion: 'sug3',
                      ),
                      MistakeSentence(
                        text: 'some text with mistake4',
                        error: 'mistake4',
                        suggestion: 'sug4',
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      text: 'Extract',
                      onPressed: () {
                        showMyNotification(
                          text: 'Extract button isn\'t working for now!',
                          context: context,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
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
                    maxLines: 20,
                    myController: myController,
                    text: args,
                  ),
                  MyButton(
                    text: 'Fix',
                    onPressed: () {
                      showMyNotification(
                        text: 'fix button isn\'t working for now!',
                        context: context,
                      );
                    },
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
