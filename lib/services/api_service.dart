import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;

import '../constants/mistake_sample.dart';
import '../models/simple_dialog.dart';
import '../constants/constants.dart';
import '../models/sentence.dart';
import 'dart:math';

import '../style/fix_text_page/text_style.dart';
import '../widgets/custom_toast.dart';

Future<List<Sentence>> postText({text = '', context}) async {
  if (text == null || text.isEmpty) {
    return [];
  }
  showMyNotification(
    text: 'Trying to connect to API to fix given text',
    context: context,
  );

  List<Sentence> sentenceList = [];
  await http
      .post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'text': text,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      )
      .then((r) => acceptHandler(r, context, sentenceList))
      .catchError((e) => errorHandler(e, context));
  return sentenceList;
}

void acceptHandler(
  http.Response response,
  BuildContext? context,
  List sentenceList,
) {
  if (response.statusCode == 200) {
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
    if (context != null) {
      showMyNotification(
        error: 'Error: ${response.statusCode}',
        text: response.body,
        context: context,
      );
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  if (context != null && sentenceList.isEmpty) {
    showMyNotification(context: context, text: 'No mistakes found!');
  }
}

void errorHandler(onError, BuildContext? context) {
  if (context != null) {
    showMyNotification(
      error: 'Error!',
      text: onError.toString(),
      context: context,
    );
  } else {
    print('Error: $onError');
  }
}

Future<List<Sentence>> postTextSample({
  text = '',
  context,
  notification = true,
}) async {
  if (text == null || text.isEmpty) {
    return [];
  }
  if (notification) {
    SmartDialog.showToast(
      '',
      alignment: Alignment.bottomCenter,
      builder: (context) {
        return const CustomToast(
          child: Text(
            'Connected to Mock API',
            style: successToast,
          ),
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
