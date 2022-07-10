import 'package:flutter/material.dart';

import '../models/file.dart';
import '../style/colors.dart';
import '../style/text_style.dart';
import '../style/upload_file_page/colors.dart';
import 'my_button.dart';

/// A widget to display some information of a single file.
///
/// This widget get those information from provided [File].
/// By clicking a certain [File], it will enable [isChoosen] and changes color to [fileInfoLinearGradient]
/// To manipulate displayed [File] provide [deleteFunc] to delete current chosen file and
/// also provide [changeFile] to go to the clicked [File].
class FileInfo extends StatelessWidget {
  const FileInfo({
    super.key,
    required this.file,
    required this.deleteFunc,
    required this.changeFile,
    this.isChoosen = false,
  });

  /// Provide [File] to get infomation to show.
  final File file;

  /// A [Function] to delete current chosen file
  final Function deleteFunc;

  /// A [Function] to change file
  final Function changeFile;

  /// Is current file chosen or not, by default [isChoosen] = false
  final bool isChoosen;

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
            onPressed: () => deleteFunc(file: file),
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
