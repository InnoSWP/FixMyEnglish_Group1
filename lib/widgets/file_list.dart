import 'package:flutter/material.dart';

import './file_info.dart';

class FileListView extends StatelessWidget {
  final List files;
  final int currentFile;
  final Function removeFile;
  final Function changeFile;
  const FileListView({
    super.key,
    required this.files,
    required this.removeFile,
    required this.changeFile,
    this.currentFile = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...files.map((file) => Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              child: FileInfo(
                isChoosen: (file.id != 0 && currentFile == file.id),
                file: file,
                changeFile: changeFile,
                deleteFunc: removeFile,
              ),
            )),
      ],
    );
  }
}
