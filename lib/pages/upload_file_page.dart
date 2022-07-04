import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../style/fix_text_page/decorations.dart';
import '../style/text_style.dart';
import '../style/upload_file_page/text_style.dart';
import '../style/colors.dart';
import '../widgets/custom_loading.dart';
import '../widgets/custom_toast.dart';
import '../widgets/default_no_file.dart';
import '../models/controller.dart';
import '../widgets/file_list.dart';
import '../widgets/app_bar.dart';
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
          DropzoneView(
            onCreated: (DropzoneViewController ctrl) => controller = ctrl,
            onHover: () => setState(() => highlight = true),
            onLeave: () => setState(() => highlight = false),
            onDrop: UploadedFile,
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
                                        removeFile: removeFile,
                                        changeFile: changeFile,
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
                                                      ? const Color(0xFF82490D)
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
                                                ? const Color(0xFF82490D)
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

  Future UploadedFile(dynamic event) async {
    final name = event.name;
    final data = await controller.getFileData(event);
    print('Name : $name');

    //widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });

    //////////
    ///
    ///

    PdfDocument document = PdfDocument(
      inputBytes: data,
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
          label: e.label,
          suggestion: e.suggestion,
          text: e.text,
          error: e.error,
        ));
      }
    });
    setState(() {
      files.add(File(
        id: currentFileId++,
        name: removeExtension(event.name),
        mistakeSentences: mistakeSentences,
      ));
    });
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
    SmartDialog.showLoading(builder: (context) {
      return const CustomLoading();
    });
    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
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
                label: e.label,
                suggestion: e.suggestion,
                text: e.text,
                error: e.error,
              ));
            }
          });
          files.add(File(
            id: currentFileId++,
            name: removeExtension(file.name),
            mistakeSentences: mistakeSentences,
          ));
        }
      } else {
        // user closed file dialog
      }
    } on PlatformException catch (e) {
      // showMyNotification(
      //   context: context,
      //   error: 'Error(PlatformException)',
      //   text: e,
      // );
      SmartDialog.showToast(
        '',
        alignment: Alignment.bottomCenter,
        builder: (context) => const CustomToast(
          msg: 'Wrong platform chosen!',
          type: ToastType.error,
        ),
      );
    } catch (e) {
      // showMyNotification(
      //   context: context,
      //   error: 'Error',
      //   text: e,
      // );
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

  void changeFile(int id) {
    SmartDialog.showLoading(builder: (context) {
      return const CustomLoading();
    });
    var index = getIndex(id: id);
    lastClick.add(id);
    setState(() {
      currentFile = index;
    });
    SmartDialog.dismiss();
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
