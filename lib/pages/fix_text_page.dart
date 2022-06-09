import 'package:fix_my_english/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/mistake_sentence.dart';

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
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF4D6658),
          title: Container(
            alignment: Alignment.center,
            child: const Image(
              width: 200,
              color: Colors.white,
              image: AssetImage('logo/logo.png'),
            ),
          )),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 300,
              color: const Color(0xFFE9F1E8),
              padding: const EdgeInsets.all(10),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.blueAccent),
              // ),
              child: Column(
                children: const [
                  MistakeSentence(text: 'some text with mistake'),
                  MistakeSentence(text: 'some text with mistake'),
                  MistakeSentence(text: 'some text with mistake'),
                  MistakeSentence(text: 'some text with mistake'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyTextField(
                    maxLines: 30,
                    myController: myController,
                    text: args,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(2),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF4D6658)),
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(50)),
                  ),
                  child: const Text('Fix'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
