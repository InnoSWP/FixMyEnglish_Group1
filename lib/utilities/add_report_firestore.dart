import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constants/constants.dart';
import '../models/report.dart';
import '../models/report_date.dart';
import '../style/fix_text_page/text_style.dart';
import '../widgets/custom_toast.dart';
import '../widgets/mistake_sentence.dart';

List<ReportDate> lastReports = [];

void addReport(MistakeSentence sentence, String reason) {
  if (reason.isEmpty) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
          child: Text(
        'No reason for bug provided!',
        style: errorToast,
      ));
    });
    return;
  }
  Report report = Report(
    match: sentence.error,
    label: sentence.label,
    sentence: sentence.text,
    description: sentence.error,
    reason: reason,
  );

  if (lastReports.any((e) => cmpReport(e.report, report))) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
          child: Text(
        'Denied, you made such report!',
        style: errorToast,
      ));
    });
    return;
  }

  if (lastReports.isNotEmpty &&
      lastReports.last.date!.difference(DateTime.now()).inMilliseconds <
          limitToMakeQueryDB) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
          child: Text(
        'Denied, too many reports!',
        style: errorToast,
      ));
    });
    return;
  }
  if (lastReports.isNotEmpty && lastReports.length >= saveNReports) {
    lastReports.removeAt(0);
  }

  // adding new report
  lastReports.add(ReportDate(report: report));

  CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');
  reports.add({
    'match': sentence.error,
    'sentence': sentence.text,
    'label': sentence.label,
    'description': sentence.suggestion,
    'reason': reason,
  }).then((value) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
          child: Text(
        'Report sent, thanks!',
        style: successToast,
      ));
    });
  }).catchError((error) {
    print('Failed: $error');
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
          child: Text(
        'Failed to record your report!',
        style: errorToast,
      ));
    });
  });
}

bool cmpReport(Report e, Report report) {
  return (e.match == report.match &&
      e.label == report.label &&
      e.description == report.description &&
      e.reason == report.reason &&
      e.sentence == report.sentence);
}
