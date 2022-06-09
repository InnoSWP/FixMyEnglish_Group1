import 'package:flutter/material.dart';

import '../widgets/file_list.dart';
import '../widgets/mistake_sentence.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  @override
  Widget build(BuildContext context) {
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
                  MistakeSentence(text: 'some text1 with mistake'),
                  MistakeSentence(text: 'some text2 with mistake'),
                  MistakeSentence(text: 'some text3 with mistake'),
                  MistakeSentence(text: 'some text4 with mistake'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF49454F),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    child: FileListView(),
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
                    child: const Text('Extract All'),
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
