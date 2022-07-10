import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/text_style.dart';
import '../utilities/report_bug.dart';
import '../widgets/my_button.dart';
import '../utilities/extract.dart';
import './default_mistake_list.dart';

/// A widget to display a list of all mistakes provided by [sentences].
///
/// If no errors are found or no files are selected, [MistakeList] only shows [defaultScreen].
/// [MistakeList] has [extract] button to extract content of [sentences] to csv file.
/// Name of csv file provided by [fileName].
/// [MistakeList] also consist of [reportBug] button, to report that highlighted mistake isn't a mistake.
class MistakeList extends StatelessWidget {
  const MistakeList({
    required this.fileName,
    super.key,
    required this.sentences,
    this.defaultScreen = const DefaultMistakeList(),
  });

  /// List of mistake sentences.
  final List sentences;

  /// Name of file when clicked [extract] button.
  final String? fileName;

  /// Display [defaultScreen] if [sentences] is empty.
  final Widget defaultScreen;

  @override
  Widget build(BuildContext context) {
    return (sentences.isEmpty
        ? defaultScreen
        : Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.only(left: 13, right: 13, bottom: 13),
                    padding: const EdgeInsets.only(left: 15, top: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: sentences[index]),
                        IconButton(
                          tooltip: 'Report a bug',
                          onPressed: () =>
                              reportBug(sentences[index], context: context),
                          icon: const ImageIcon(
                            AssetImage("assets/icons/report_bug.png"),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: sentences.length,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(8.0),
                child: MyButton(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: backgroundButton,
                  width: 185,
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset("assets/icons/csv_icon.png"),
                      const SizedBox(width: 10),
                      const Text('Extract to csv', style: extractButtonStyle),
                    ],
                  ),
                  onPressed: () => extract(fileName, sentences),
                ),
              ),
            ],
          ));
  }
}
