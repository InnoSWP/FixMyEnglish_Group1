import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import '../widgets/my_button.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/';

  final myController = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        color: colorPrimaryRedCaramel,
        child: Column(
          children: [
            MyTextField(
              myController: myController,
              maxLines: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  text: 'Upload',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/upload_file',
                    );
                  },
                ),
                MyButton(
                  text: 'Fix',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/fix_text',
                      arguments: myController.text,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
