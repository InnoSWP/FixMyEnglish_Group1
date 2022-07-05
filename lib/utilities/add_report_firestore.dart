import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../constants/constants.dart';
import '../models/report.dart';
import '../models/report_date.dart';
import '../widgets/custom_toast.dart';
import '../widgets/mistake_sentence.dart';

List<ReportDate> lastReports = [];

void addReport(MistakeSentence sentence, String reason) {
  if (reason.isEmpty) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
        msg: 'No reason for bug provided!',
        type: ToastType.error,
      );
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
        msg: 'Denied, you made such report!',
        type: ToastType.error,
      );
    });
    return;
  }
  DateTime now = DateTime.now();

  if (lastReports.isNotEmpty &&
      lastReports.last.date!.difference(now).inMilliseconds.abs() <
          limitToMakeQueryDB) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
        msg: 'Denied, too many reports!',
        type: ToastType.error,
      );
    });
    return;
  }
  if (lastReports.isNotEmpty && lastReports.length >= saveNReports) {
    lastReports.removeAt(0);
  }

  // adding new report
  lastReports.add(ReportDate(report: report, date: now));

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
      return const CustomToast(msg: 'Report sent, thanks!');
    });
  }).catchError((error) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
        msg: 'Failed to record your report!',
        type: ToastType.error,
      );
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
