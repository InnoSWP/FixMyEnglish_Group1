import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../widgets/file_list.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';
import '../widgets/mistake_sentence.dart';
import '../widgets/my_button.dart';
import '../models/simple_dialog.dart';
import '../widgets/mistake_list.dart';
import '../models/file.dart';
import '../widgets/default_file_list.dart';
import '../utilities/extract.dart';
import '../constants/constants.dart';
import '../utilities/extension.dart';
import '../services/api_service.dart';
import '../utilities/last_clicked_file.dart';

class UploadFilePage extends StatefulWidget {
  static const pageName = '/upload_file';

  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  static final files = [
    File(name: 'emptyFile', id: 0),
  ];
  int currentFile = 0;
  int currentFileId = 1;
  LastClick lastClick = LastClick();

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
            flex: 1,
            child: Container(
              color: colorTextSmoothBlack,
              child: Stack(
                children: [
                  Column(
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
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          child: Text('New file'),
                          onPressed: _pickFiles,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        MyButton(
                          child: Text('Extract All'),
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
      lastClick.remove(file.id);
      setState(() {
        files.remove(file);
        currentFile = getIndex(id: lastClick.getId());
      });
      print('file with id: ${file.id} removed!');
    } else if (id != null) {
      for (var filei in files) {
        if (filei.id == id) {
          lastClick.remove(id);
          setState(() {
            files.remove(filei);
            currentFile = getIndex(id: lastClick.getId());
          });
          print('file with id: $id removed!');
          break;
        }
      }
    } else {
      print('can\'t remove file');
    }
  }

  // when a user click to 'New file' button a user should be able to pick a file to upload
  // allowed extensions: pdf
  void _pickFiles() async {
    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
      );
      if (result != null && result.files.isNotEmpty) {
        for (final file in result.files) {
          PdfDocument document = PdfDocument(
            inputBytes: file.bytes,
          );
          PdfTextExtractor extractor = PdfTextExtractor(document);

          String text = extractor.extractText();

          List mistakeSentences = [];
          postText(
            text: text,
            context: context,
          ).then((l) {
            for (var e in l) {
              mistakeSentences.add(MistakeSentence(
                suggestion: e.suggestion,
                text: e.text,
                error: e.error,
              ));
            }
          });
          setState(() {
            files.add(File(
              id: currentFileId++,
              name: removeExtension(file.name),
              mistakeSentences: mistakeSentences,
            ));
          });
        }
      } else {
        // user closed file dialog
      }
    } on PlatformException catch (e) {
      showMyNotification(
        context: context,
        error: 'Error(PlatformException)',
        text: e,
      );
    } catch (e) {
      showMyNotification(
        context: context,
        error: 'Error',
        text: e,
      );
    }
    return;
  }

  void changeFile(int id) {
    var index = getIndex(id: id);
    lastClick.add(id);
    setState(() {
      currentFile = index;
    });
  }

  int getIndex({File? file, int? id}) {
    if (file != null && files.contains(file)) {
      return files.indexOf(file);
    } else if (id != null) {
      for (int i = 0; i < files.length; i++) {
        if (files[i].id == id) {
          return i;
        }
      }
    }
    return 0;
  }
}
