import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../style/decorations.dart';
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

/// ### The Upload Page of [FixMyEnglish](https://fix-my-english-c6270.web.app/#/upload_file).
///
/// Upload page consist of [MistakeList] and [FileListView].
///
/// [FileListView] - is where you can upload your files.
/// There are two ways to upload files.
/// 1. By `Upload More` button or `Add pdf` if its first file:
///     - By clicking one of these buttons you will be able to pick a file or files if [allowMultipleFileUpload] enabled.
/// You can only upload files with extensions listed in [allowedExtensions].
///
/// 2. By Drag and Drop
///     - To upload new file its enough to drag and drop it into website. if [allowDragAndDrop] option is enabled.
/// You can only Drag and drop files with extensions listed in [allowedExtensions]. Otherwise you will get a warning.
///
///
/// [MistakeList] - list of mistakes received from API, it will show all mistakes and
/// by hover on error phrases there appears a box where you see a description for an error.
/// if you think that error that was provided by API is wrong(false-positive) you can send
/// report by clicking red button near each sentence.
///
/// #### Toasts(Message, Notification) that you can get:
/// 1. INFO - type
///   - `Connected to API` - successfully connected to the API, congratulations!
///   - `No mistake found!` - Your text was sent to API, and API didn't detect any mistakes, lucky you!
///   - `Report sent, thanks!` - Your report was successfully recorded to FireStore, thanks again :)
/// 2. WARNING - type
///   - `Unsupported file type.` - Uploaded a file which is not supported. i.e not listed in [allowedExtensions].
///   - `Connected to Mock API` - Connected to Mock API which is only for displaying some predefined data,
/// you can disable it in [addNewFile] pass parameter `connectMock:false` in postText() function.
/// 3. ERROR - type
///   - `Wrong platform chosen!` - Can't use [FilePicker] in this platform.
///   - `Can't upload file(s)!` - Something went wrong while picking files.
///   - `Failed to connect to API` - API is not available or there is some other problem with API or hosting.
///   - `No reason for bug provided` - Trying to send a report which has no reason.
///   - `Failed with status code: $statusCode!` - Trying connect to API, but API sent statusCode different from `200`.
///   - `Denied, you made such report!` - if you are trying to send report which is similar to one of [saveNReports] last reports.
///   - `Denied, too many reports!` - if your difference between your two last reports is less than [limitToMakeQueryDB] milliseconds.
///   - `Failed to record your report!` - if something will go wrong while trying to send your report to firebase
///   - `Can't find provided label!` - if API sent a label which is not add in [labelToIconAsset].
class UploadFilePage extends StatefulWidget {
  static const pageName = '/upload_file';
  final myController = MyController(TextEditingController());
  UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  /// List of files which is used in [FileListView].
  static final files = [
    File(name: 'emptyFile', id: 0),
  ];

  /// It's for Drag and Drop. when draged file is onHover on [FileListView] colors will change.
  bool highlight = false;

  /// Current file id which is displayed in [MistakeList].
  int currentFile = 0;

  /// Next ids for a file. Incrementing each time to have unique ids.
  int currentFileId = 1;

  /// List of last clicked `id` of files. To better navigate to between files.
  LastClick lastClick = LastClick();

  /// Controller for [DropzoneView].
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: backgroundPageColor,
      body: Stack(
        children: [
          if (kIsWeb && allowDragAndDrop)
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

  /// Function for uploading new files through Drag and Drop functionality.
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

  /// Remove a file from [files] by its [id] or [file] itself.
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

  /// Function for uploading new files through `Upload More` button.
  ///
  /// Only files with [allowedExtensions] are allowed.
  /// To prohibit Multiple File unable [allowMultipleFileUpload].
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
          msg: 'Can\'t upload file(s)!',
          type: ToastType.error,
        ),
      );
    }
    SmartDialog.dismiss();
    setState(() {});
    return;
  }

  /// By clicking on any files, page content should be changed.
  void _changeFile(int id) {
    SmartDialog.showLoading();
    var index = _getIndex(id: id);
    lastClick.add(id);
    setState(() => currentFile = index);
    SmartDialog.dismiss();
  }

  /// Get index of a certain file in [files].
  ///
  /// For [_getIndex] you can pass [file] itself or [id] of a file.
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
