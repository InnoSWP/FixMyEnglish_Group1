import 'package:fix_my_english/utilities/add_mistake_sentence.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../constants/constants.dart';
import '../models/file.dart';
import '../services/api_service.dart';
import 'extension.dart';

/// A function that add new [file] to [filesList].
/// 
/// It takes [file] as `List<int>` and by using [PdfDocument] and [PdfTextExtractor]
/// converts it into [String] and called [postText] with this [String].
/// And then its gather all data from [postText] into one [List] and create a
/// [File] with these data. Finally this [File] will be added into [filesList].
/// 
/// If [filesList] is not provided it will take empty [List] by default.
/// If [fileName] is not provided it will take [defaultFileName].
/// To manipulate [filesList] it required to provide [currentFileId].
Future<void> addNewFile({
  required file,
  context,
  filesList = const [],
  required currentFileId,
  fileName = defaultFileName,
}) async {
  PdfDocument document = PdfDocument(
    inputBytes: file,
  );
  PdfTextExtractor extractor = PdfTextExtractor(document);

  String text = extractor.extractText();

  List mistakeSentences = [];
  for (var e in (await postText(
    text: text,
    context: context,
  ))) {
    addSentence(e, mistakeSentences);
  }

  filesList.add(File(
    id: currentFileId++,
    name: removeExtension(fileName),
    mistakeSentences: mistakeSentences,
  ));
}
