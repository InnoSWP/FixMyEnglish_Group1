import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:csv/csv.dart';

Future<void> extract(String? fileName, List data, {String path = '.'}) async {
  List<List<dynamic>> rows = [];
  List<dynamic> row = [];
  row.add("Match");
  row.add("Sentence");
  row.add("Label");
  row.add("Description");
  rows.add(row);
  for (int i = 0; i < data.length; i++) {
    List<dynamic> row = [];
    row.add(data[i].error);
    row.add(data[i].text);
    row.add(data[i].label);
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
    ..download = '$fileName.csv';
  html.document.body?.children.add(anchor);

  anchor.click();

  html.document.body?.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}
