import 'package:flutter/material.dart';

import '../models/file.dart';
import './file_info.dart';

class FileListView extends StatefulWidget {
  const FileListView({super.key});

  @override
  State<FileListView> createState() => _FileListViewState();
}

class _FileListViewState extends State<FileListView> {
  static final _files = <File>[
    File(name: 'file1', id: 1),
    File(name: 'file2', id: 2),
    File(name: 'file3', id: 3),
    File(name: 'file4', id: 4),
    File(name: 'file5', id: 5),
    File(name: 'file6', id: 6),
    File(name: 'file7', id: 7),
    File(name: 'file8', id: 8),
    File(name: 'file9', id: 9),
  ];

  void removeFile({int? id, File? file}) {
    if (file != null && _files.contains(file)) {
      setState(() {
        _files.remove(file);
      });
      print('file with id: ${file.id} removed!');
    } else if (id != null) {
      for (var filei in _files) {
        if (filei.id == id) {
          setState(() {
            _files.remove(filei);
          });
          print('file with id: $id removed!');
          break;
        }
      }
    } else {
      print('can\'t remove file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ..._files.map((file) => FileInfo(
              file: file,
              deleteFunc: removeFile,
            )),
      ],
    );
  }
}
