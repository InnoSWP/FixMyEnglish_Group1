import 'package:flutter/material.dart';

import '../style/fix_text_page/colors.dart';

/// A widget to show when no file chosen or imported.
class DefaultFileList extends StatelessWidget {
  const DefaultFileList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/icons/upload_file_not_imported.png"),
        const SizedBox(height: 38),
        const Text(
          'No pdf imported',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Eczar',
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Please add pdf for iExtract to check',
          style: TextStyle(
            color: noTextColor,
          ),
        ),
      ],
    );
  }
}
