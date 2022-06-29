import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';
import '../utilities/report_bug.dart';
import '../widgets/my_button.dart';
import '../utilities/extract.dart';
import '../models/simple_dialog.dart';
import './default_mistake_list.dart';

class MistakeList extends StatelessWidget {
  final List sentences;
  final Widget defaultScreen;
  const MistakeList({
    super.key,
    required this.sentences,
    this.defaultScreen = const DefaultMistakeList(),
  });

  @override
  Widget build(BuildContext context) {
    return (sentences.isEmpty
        ? defaultScreen
        : Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    // border for each sentence
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black38),
                    //   borderRadius:
                    //       const BorderRadius.all(Radius.circular(5.0)),
                    // ),
                    margin:
                        const EdgeInsets.only(left: 13, right: 13, bottom: 13),
                    padding: const EdgeInsets.only(left: 15, top: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: sentences[index]),
                        IconButton(
                          tooltip: 'Report a bug',
                          onPressed: () => reportBug(context: context),
                          icon: const ImageIcon(
                            AssetImage('icons/report_bug.png'),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: sentences.length,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  // gradient: buttonLinearGradient,
                  color: backgroundButton,
                  width: 185,
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset('icons/csv_icon.png'),
                      const SizedBox(width: 10),
                      const Text('Extract to csv', style: extractButtonStyle),
                    ],
                  ),
                  onPressed: () {
                    showMyNotification(
                      text: 'Extract button isn\'t working for now!',
                      context: context,
                    );
                    extract(sentences);
                  },
                ),
              ),
            ],
          ));
  }
}
