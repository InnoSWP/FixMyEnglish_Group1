import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import '../widgets/my_button.dart';

class HomePage extends StatelessWidget {
  final myController = TextEditingController();
  HomePage({super.key});

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              // height: 550,
              color: const Color(0xFF864921),
              padding: const EdgeInsets.all(20),
              child: MyTextField(
                myController: myController,
                maxLines: 27,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(width: 30),
              MyButton(
                text: 'Upload',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/upload_file',
                  );
                },
                height: 50,
                width: 90,
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/upload_file',
              //     );
              //   },
              //   child: const Text('upload'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/fix_text',
              //       arguments: myController.text,
              //     );
              //   },
              //   child: const Text('Fix'),
              // ),

              MyButton(
                text: 'Fix',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/fix_text',
                    arguments: myController.text,
                  );
                },
                height: 50,
                width: 90,
              ),
            ],
          )
        ],
      ),
    );
  }
}
