import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../style/fix_text_page/decorations.dart';
import '../style/text_style.dart';
import '../style/upload_file_page/text_style.dart';
import '../style/colors.dart';
import '../utilities/add_new_file.dart';
import '../widgets/custom_toast.dart';
import '../widgets/default_no_file.dart';
import '../models/controller.dart';
import '../widgets/file_list.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';
import '../widgets/mistake_list.dart';
import '../models/file.dart';
import '../widgets/default_file_list.dart';
import '../utilities/extract.dart';
import '../constants/constants.dart';
import '../utilities/last_clicked_file.dart';

class UploadFilePage extends StatefulWidget {
  static const pageName = '/upload_file';
  final myController = MyController(TextEditingController());
  UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  static final files = [
    File(name: 'emptyFile', id: 0),
  ];
  bool highlight = false;
  int currentFile = 0;
  int currentFileId = 1;
  LastClick lastClick = LastClick();
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
        children: [
          if (kIsWeb)
            DropzoneView(
              onCreated: (DropzoneViewController ctrl) => controller = ctrl,
              onHover: () => setState(() => highlight = true),
              onLeave: () => setState(() => highlight = false),
              onDrop: uploadDropedFile,
            ),
          Column(
            children: [
              const Divider(color: colorPrimaryRedCaramel, height: 3),
              const Divider(color: colorPrimaryRedCaramel, height: 5),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                        decoration: decorationBlocks,
                        child: MistakeList(
                          fileName: files[currentFile].name,
                          sentences: files[currentFile].mistakeSentences,
                          defaultScreen: const DefaultFileList(),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(20),
                      decoration: decorationBlocks,
                      child: (files.length == 1
                          ? DefaultNoFile(onPressed: _pickFiles)
                          : Stack(children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom:
                                              30), // if list is filled to have some space below so last file could be accessible
                                      child: FileListView(
                                        currentFile: files[currentFile].id,
                                        files: files.sublist(1),
                                        removeFile: _removeFile,
                                        changeFile: _changeFile,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyButton(
                                            onPressed: _pickFiles,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/add_file_button.png",
                                                  color: highlight
                                                      ? onHoverDragDropButton
                                                      : backgroundButton,
                                                ),
                                                const Text(
                                                  'Upload more',
                                                  style: uploadMoreButton,
                                                )
                                              ],
                                            ),
                                          ),
                                          MyButton(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16.0)),
                                            width: 200,
                                            color: highlight
                                                ? onHoverDragDropButton
                                                : backgroundButton,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/csv_icon.png"),
                                                  const Text(
                                                    'Extract all to csv',
                                                    style: extractButtonStyle,
                                                  ),
                                                ]),
                                            onPressed: () {
                                              for (final file
                                                  in files.sublist(1)) {
                                                extract(
                                                  file.name,
                                                  file.mistakeSentences,
                                                );
                                              }
                                            },
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
                            ])),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future uploadDropedFile(dynamic event) async {
    SmartDialog.showLoading();
    final data = await controller.getFileData(event);
    setState(() => highlight = false);

    await addNewFile(
      file: data,
      context: context,
      currentFileId: currentFileId++,
      fileName: event.name,
      filesList: files,
    );
    SmartDialog.dismiss();
    setState(() {});
  }

  void _removeFile({int? id, File? file}) {
    if (file != null && files.contains(file)) {
      lastClick.remove(file.id);
      setState(() {
        files.remove(file);
        currentFile = _getIndex(id: lastClick.getId());
      });
    } else if (id != null) {
      for (var filei in files) {
        if (filei.id == id) {
          lastClick.remove(id);
          setState(() {
            files.remove(filei);
            currentFile = _getIndex(id: lastClick.getId());
          });
          break;
        }
      }
    }
  }

  // when a user click to 'New file' button a user should be able to pick a file to upload
  // allowed extensions: pdf
  void _pickFiles() async {
    SmartDialog.showLoading();
    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultipleFileUpload,
      );
      if (result != null && result.files.isNotEmpty) {
        for (final file in result.files) {
          await addNewFile(
            file: file.bytes,
            context: context,
            currentFileId: currentFileId++,
            filesList: files,
            fileName: file.name,
          );
        }
      }
    } on PlatformException {
      SmartDialog.showToast(
        '',
        alignment: Alignment.bottomCenter,
        builder: (context) => const CustomToast(
          msg: 'Wrong platform chosen!',
          type: ToastType.error,
        ),
      );
    } catch (e) {
      SmartDialog.showToast(
        '',
        alignment: Alignment.bottomCenter,
        builder: (context) => const CustomToast(
          msg: 'Can\'t upload files!',
          type: ToastType.error,
        ),
      );
    }
    SmartDialog.dismiss();
    setState(() {});
    return;
  }

  void _changeFile(int id) {
    SmartDialog.showLoading();
    var index = _getIndex(id: id);
    lastClick.add(id);
    setState(() => currentFile = index);
    SmartDialog.dismiss();
  }

  int _getIndex({File? file, int? id}) {
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
