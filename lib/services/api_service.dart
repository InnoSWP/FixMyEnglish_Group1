import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../constants/mistake_sample.dart';
import '../constants/constants.dart';
import '../models/sentence.dart';
import '../widgets/custom_toast.dart';

/// Current state of API. It will be changed throughout the running time of a program.
bool isAPIWorking = false;

/// Create a parameters for `POST` query, and then connect to API and send this query.
///
/// API alocated at [apiUrl]. API returns `json` which is parsed and
/// returned as `List<Sentence>` in [postText].
///
/// if [text] will be `empty` or null it will ignore this query.
///
/// if API is not working ypu can try Mock API by [connectMock]. It will give
/// you predefined [apiSample]. Its helpful when you want to check something.
Future<List<Sentence>> postText({
  text = '',
  context,
  connectMock = true,
}) async {
  if (text == null || text.isEmpty) {
    return [];
  }

  List<Sentence> sentenceList = [];
  await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode({
      'text': text,
    }),
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  ).then((r) {
    acceptHandler(r, context, sentenceList, text, connectMock);
  }).catchError((e) async {
    errorHandler(e, context);
    if (connectMock) {
      sentenceList.addAll((await postTextSample(
        context: context,
        text: text,
      )));
    }
  });
  return sentenceList;
}

/// If query was sent successfully parse it and add new [Sentence] to [sentenceList].
///
/// But if `response.statusCode` is differs from `200`, it will throw an error.
void acceptHandler(http.Response response, BuildContext? context,
    List sentenceList, text, connectMock) async {
  if (response.statusCode == 200) {
    if (!isAPIWorking) {
      SmartDialog.showToast(
        '',
        alignment: Alignment.bottomCenter,
        builder: (context) {
          return const CustomToast(
            msg: 'Connected to API',
          );
        },
      );
      isAPIWorking = true;
    }
    // success
    final body = jsonDecode(response.body) as List;
    for (var e in body) {
      sentenceList.add(Sentence(
        label: e['label'] as String,
        text: e['sentence'] as String,
        suggestion: e['description'] as String,
        error: e['match'] as String,
      ));
    }
  } else {
    SmartDialog.showToast(
      '',
      alignment: Alignment.bottomCenter,
      builder: (context) {
        return CustomToast(
          msg: 'Failed with status code: ${response.statusCode}!',
          type: ToastType.error,
        );
      },
    );
    isAPIWorking = false;
    if (connectMock) {
      sentenceList.addAll((await postTextSample(
        context: context,
        text: text,
      )));
    }
  }
  if (sentenceList.isEmpty) {
    SmartDialog.showToast(
      '',
      alignment: Alignment.bottomCenter,
      builder: (context) {
        return const CustomToast(msg: 'No mistake found!');
      },
    );
  }
}

/// Query was not successfully, it will show an error.
void errorHandler(onError, BuildContext? context) {
  isAPIWorking = false;
  SmartDialog.showToast(
    '',
    alignment: Alignment.bottomCenter,
    builder: (context) {
      return const CustomToast(
        msg: 'Failed to connect to API',
        type: ToastType.error,
      );
    },
  );
}

/// Its a Mock API which is send you random [Sentence] from [apiSample].
Future<List<Sentence>> postTextSample({
  text = '',
  context,
}) async {
  if (text == null || text.isEmpty) {
    return [];
  }
  if (!isAPIWorking) {
    SmartDialog.showToast(
      '',
      alignment: Alignment.bottomCenter,
      builder: (context) {
        return const CustomToast(
          msg: 'Connected to Mock API',
          type: ToastType.warning,
        );
      },
      displayTime: const Duration(seconds: 1),
    );
  }

  /// To simulate the real API :)
  await Future.delayed(const Duration(seconds: 2));

  List<Sentence> sentenceList = [];

  var now = DateTime.now();
  Random rnd = Random(now.millisecondsSinceEpoch);
  int n = apiSample.length;
  for (int i = 0; i < numberSamplePerPage; i++) {
    sentenceList.add(apiSample[rnd.nextInt(n)]);
  }

  return sentenceList;
}
