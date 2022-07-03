import 'package:flutter/material.dart';

import '../models/file.dart';
import '../style/colors.dart';
import '../style/text_style.dart';
import '../style/upload_file_page/button_style.dart';
import 'my_button.dart';

class FileInfo extends StatelessWidget {
  final File file;
  final Function deleteFunc;
  final Function changeFile;
  final bool isChoosen;
  const FileInfo({
    super.key,
    required this.file,
    required this.deleteFunc,
    required this.changeFile,
    this.isChoosen = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyButton(
      height: 90,
      border: Border.all(width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      gradient: (isChoosen ? fileInfoLinearGradient : null),
      color: (isChoosen ? null : colorTextbackgroundtextbox),
      onPressed: () => changeFile(file.id),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/icons/pdf_button.png",
            width: 30,
            height: 35,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                file.name ?? 'File name not specified!',
                style: fileInfoStyle,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              deleteFunc(file: file);
            },
            icon: const ImageIcon(
              AssetImage("assets/icons/delete_button.png"),
              color: Colors.red,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
