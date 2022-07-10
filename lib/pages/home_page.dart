import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../style/decorations.dart';
import '../style/fix_text_page/colors.dart';
import '../utilities/analyse_text_button.dart';
import '../widgets/text_field.dart';
import '../style/fix_text_page/text_style.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_button.dart';
import '../models/controller.dart';
import '../widgets/mistake_list.dart';
import '../style/colors.dart';

/// ### The Main Page of [FixMyEnglish](https://fix-my-english-c6270.web.app/).
///
/// Home page consist of [MistakeList] and [MyTextField].
///
/// [MyTextField] - is where you can type a text then press `Analyse text`
/// button to send your text to API, after receiving from API results it will show all
/// the mistakes in [MistakeList].
/// Empty [MyTextField] will be ignored.
///
/// [MistakeList] - list of mistakes received from API, it will show all mistakes and
/// by hover on error phrases there appears a box where you see a description for an error.
/// if you think that error that was provided by API is wrong(false-positive) you can send
/// report by clicking red button near each sentence.
///
/// There also button in [AppBar] called `Bulk Upload`, where by clicking
/// you will be directed to next page(Upload File Page).
///
/// #### Toasts(Message, Notification) that you can get:
/// 1. INFO - type
///   - `Connected to API` - successfully connected to the API, congratulations!
///   - `No mistake found!` - Your text was sent to API, and API didn't detect any mistakes, lucky you!
///   - `Report sent, thanks!` - Your report was successfully recorded to FireStore, thanks again :)
/// 2. WARNING - type
///   - `Connected to Mock API` - Connected to Mock API which is only for displaying some predefined data,
/// you can disable it in [analyseTextButton] pass parameter `connectMock:false` in postText() function.
/// 3. ERROR - type
///   - `Failed to connect to API` - API is not available or there is some other problem with API or hosting.
///   - `No reason for bug provided` - Trying to send a report which has no reason.
///   - `Failed with status code: $statusCode!` - Trying connect to API, but API sent statusCode different from `200`.
///   - `Denied, you made such report!` - if you are trying to send report which is similar to one of [saveNReports] last reports.
///   - `Denied, too many reports!` - if your difference between your two last reports is less than [limitToMakeQueryDB] milliseconds.
///   - `Failed to record your report!` - if something will go wrong while trying to send your report to firebase
///   - `Failed to fetch data from API` - if something will go wrong after pressing `Analyse text`
///   - `Can't find provided label!` - if API sent a label which is not add in [labelToIconAsset].
class HomePage extends StatefulWidget {
  static const pageName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller for the [MyTextField], for taking the text you typed.
  final myController = MyController(TextEditingController());

  /// List of sentences that [MistakeList] will have.
  static final _sentences = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(actions: true),
      backgroundColor: backgroundPageColor,
      body: Column(
        children: [
          const Divider(color: colorPrimaryRedCaramel, height: 3),
          const Divider(color: colorPrimaryRedCaramel, height: 5),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    decoration: decorationBlocks,
                    child: MistakeList(
                      fileName: defaultFileName,
                      sentences: _sentences,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: decorationBlocks,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MyTextField(
                          maxLines: 50,
                          myController: myController,
                          borderRadius: 20.0,
                        ),
                        Container(
                          decoration: decorationBlocks,
                          margin: const EdgeInsets.only(bottom: 18),
                          child: MyButton(
                            onPressed: () async {
                              await analyseTextButton(
                                context: context,
                                myController: myController,
                                sentences: _sentences,
                              );
                              setState(() {});
                            },
                            height: 50,
                            width: 185,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            gradient: buttonLinearGradient,
                            child: Row(
                              children: [
                                Image.asset("assets/icons/analyze_icon.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Analyse text',
                                  style: analyzeButton,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
