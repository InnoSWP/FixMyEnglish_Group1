import 'package:flutter/material.dart';

import './file_info.dart';

/// A widget to show list of all files that user uploaded.
///
/// Files are taken from [files] that passed through constructor
/// To manipulate those [files] we can use [removeFile] to remove file
/// and [changeFile] to change current chosen file
class FileListView extends StatelessWidget {
  const FileListView({
    super.key,
    required this.files,
    required this.removeFile,
    required this.changeFile,
    this.currentFile = 0,
  });

  /// List of uploaded files.
  final List files;

  /// Current chosen file id.
  final int currentFile;

  /// A [Function] to delete current chosen file
  final Function removeFile;

  /// A [Function] to change file
  final Function changeFile;

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
