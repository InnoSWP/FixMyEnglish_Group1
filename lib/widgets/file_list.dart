import 'package:flutter/material.dart';

class File {
  String? name;
  int id = 0;
  File({required this.name, required this.id});
}

class FileListView extends StatefulWidget {
  const FileListView({super.key});

  @override
  State<FileListView> createState() => _FileListViewState();
}

class _FileListViewState extends State<FileListView> {
  final files = <File>[
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
    if (file != null && files.contains(file)) {
      files.remove(file);
      print('file with id: ${file.id} removed!');
    } else if (id != null) {
      for (var filei in files) {
        if (filei.id == id) {
          files.remove(filei);
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
        ...files.map(((file) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                color: const Color(0xFF864921),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      file.name ?? 'No file found',
                      style: const TextStyle(fontSize: 24),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            removeFile(file: file);
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ))),
      ],
    );
  }
}
