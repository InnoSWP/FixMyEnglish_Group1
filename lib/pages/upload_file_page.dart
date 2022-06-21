import 'package:flutter/material.dart';

import '../widgets/file_list.dart';
import '../widgets/mistake_sentence.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';
import '../widgets/my_button.dart';
import '../models/simple_dialog.dart';

class UploadFilePage extends StatefulWidget {
  static const pageName = '/upload_file';

  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  final _sentences = const [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: colorSecondaryLightGreenPlant,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      margin: const EdgeInsets.only(
                          left: 13, right: 13, bottom: 13),
                      padding: const EdgeInsets.only(left: 15),
                      child: _sentences[index],
                    ),
                    itemCount: _sentences.length,
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
            child: Container(
              color: colorTextSmoothBlack,
              child: Column(
                children: [
                  const Expanded(
                    child: FileListView(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      text: 'Extract All',
                      onPressed: () {
                        showMyNotification(
                          text: 'Extract All button isn\'t working for now!',
                          context: context,
                        );
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
