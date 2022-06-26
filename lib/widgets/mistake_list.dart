import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/fix_text_page/button_style.dart';
import '../style/fix_text_page/colors.dart';
import '../style/fix_text_page/text_style.dart';
import '../widgets/my_button.dart';
import '../utilities/extract.dart';
import '../models/simple_dialog.dart';
import './default_mistake_list.dart';

class MistakeList extends StatelessWidget {
  final List sentences;
  const MistakeList({super.key, required this.sentences});

  @override
  Widget build(BuildContext context) {
    return (sentences.isEmpty
        ? const DefaultMistakeList()
        : Stack(
            children: [
              Container(
                // alignment: Alignment.bottomLeft,
                width: double.infinity,
                color: backgroundBlocks,
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.blueAccent),
                // ),
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    margin:
                        const EdgeInsets.only(left: 13, right: 13, bottom: 13),
                    padding: const EdgeInsets.only(left: 15, top: 13),
                    child: sentences[index],
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
                      const Text('Extract to csv', style: analyzeButton),
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
