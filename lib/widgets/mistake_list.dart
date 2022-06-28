import 'package:flutter/material.dart';

import '../style/colors.dart';
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
                color: colorSecondaryLightGreenPlant,
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
                  text: 'Extract',
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
