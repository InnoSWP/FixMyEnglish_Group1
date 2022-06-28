import 'package:flutter/material.dart';

import '../models/file.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class FileInfo extends StatelessWidget {
  final File file;
  final Function deleteFunc;
  const FileInfo({super.key, required this.file, required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        color: Color(0xFFF2EEE1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              file.name ?? 'File name not specified!',
              style: fileInfoStyle,
              overflow: TextOverflow.ellipsis,
            ),
            IconButton(
                onPressed: () {
                  deleteFunc(file: file);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
