import 'package:flutter/material.dart';

import './file_info.dart';

class FileListView extends StatelessWidget {
  final List files;
  final Function removeFile;
  final Function changeFile;
  const FileListView(
      {super.key, required this.files, required this.removeFile, required this.changeFile});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...files.map((file) => TextButton(
              onPressed: () => changeFile(file.id),
              child: FileInfo(
                file: file,
                deleteFunc: removeFile,
              ),
            )),
      ],
    );
  }
}
