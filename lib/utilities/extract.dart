import 'dart:convert';
import 'dart:html' as html;
import 'dart:io' as io;
import 'dart:async';
import 'package:csv/csv.dart';

Future<void> extract(List data, {String path='.'}) async {
  List<List<dynamic>> rows = [];
  List<dynamic> row = [];
  row.add("Match");
  row.add("Sentence");
  // row.add("Label");
  row.add("Description");
  rows.add(row);
    for (int i = 0; i < data.length; i++) {
      List<dynamic> row = [];
      row.add(data[i].error);
      row.add(data[i].text);
      row.add(data[i].suggestion);
      rows.add(row);
    }

  String csv = const ListToCsvConverter().convert(rows);
  final bytes = utf8.encode(csv);
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = 'file.csv';
  html.document.body?.children.add(anchor);

  anchor.click();

  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);

  // final filename = 'file.csv';
  // var file = io.File(filename);
  // file.writeAsStringSync(csv);
  // final rawData = file.readAsBytesSync();
  // final content = base64Encode(rawData);
  // AnchorElement(
  //     href: "data:application/octet-stream;charset=utf-16le;base64,$content")
  //   ..setAttribute("download", "file.csv")
  //   ..click();
}
