import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import '../constants/mistake_sample.dart';
import '../constants/constants.dart';
import '../models/sentence.dart';
import '../widgets/custom_toast.dart';

bool isAPIWorking = false;

Future<List<Sentence>> postText({text = '', context}) async {
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
    acceptHandler(r, context, sentenceList, text);
  }).catchError((e) async {
    errorHandler(e, context);
    sentenceList.addAll((await postTextSample(
      context: context,
      text: text,
    )));
  });
  return sentenceList;
}

void acceptHandler(
  http.Response response,
  BuildContext? context,
  List sentenceList,
  text,
) async {
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
    body.forEach((e) {
      sentenceList.add(Sentence(
        label: e['label'] as String,
        text: e['sentence'] as String,
        suggestion: e['description'] as String,
        error: e['match'] as String,
      ));
    });
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
    sentenceList.addAll((await postTextSample(
      context: context,
      text: text,
    )));
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

  print('Error: $onError');
}

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
