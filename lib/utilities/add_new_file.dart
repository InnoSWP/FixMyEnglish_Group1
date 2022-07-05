import 'package:fix_my_english/utilities/add_mistake_sentence.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../models/file.dart';
import '../services/api_service.dart';
import 'extension.dart';

Future<void> addNewFile({
  required file,
  context,
  filesList,
  currentFileId,
  fileName,
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
