import 'package:flutter/material.dart';

import '../widgets/file_list.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';
import '../widgets/my_button.dart';
import '../models/simple_dialog.dart';
import '../widgets/mistake_list.dart';
import '../models/file.dart';
import '../widgets/default_file_list.dart';
import '../utilities/extract.dart';

class UploadFilePage extends StatefulWidget {
  static const pageName = '/upload_file';

  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  final files = [
    File(name: 'emptyFile', id: 0),
    File(name: 'file_1', id: 1),
    File(name: 'file_2', id: 2),
    File(name: 'file_3', id: 3),
  ];
  int currentFile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: MistakeList(
              sentences: files[currentFile].mistakeSentences,
            ),
          ),
          Expanded(
            child: Container(
              color: colorTextSmoothBlack,
              child: Stack(
                children: [
                  Expanded(
                    child: (files.length == 1
                        ? const DefaultFileList()
                        : FileListView(
                            files: files.sublist(1),
                            removeFile: removeFile,
                            changeFile: changeFile,
                          )),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          text: '   New file   ',
                          onPressed: _pickFiles,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MyButton(
                          text: 'Extract All',
                          onPressed: () {
                            showMyNotification(
                              text:
                                  'Extract All button isn\'t working for now!',
                              context: context,
                            );
                            for (final file in files) {
                              extract(file.mistakeSentences);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void removeFile({int? id, File? file}) {
    if (file != null && files.contains(file)) {
      setState(() {
        files.remove(file);
        if (file.id == currentFile) {
          currentFile--;
        }
      });
      print('file with id: ${file.id} removed!');
    } else if (id != null) {
      for (var filei in files) {
        if (filei.id == id) {
          setState(() {
            files.remove(filei);
            if (id == currentFile) {
              currentFile--;
            }
          });
          print('file with id: $id removed!');
          break;
        }
      }
    } else {
      print('can\'t remove file');
    }
  }

  void _pickFiles() async {
    // TODO: implementation for add new file button
    // when a user click to 'New file' button a user should be able to pick a file to upload
    // extensions: pdf
    return;
  }

  void changeFile(int id) {
    var index = 0;
    for (var i = 0; i < files.length; i++) {
      if (files[i].id == id) {
        index = i;
        break;
      }
    }
    setState(() {
      currentFile = index;
    });
  }
}
