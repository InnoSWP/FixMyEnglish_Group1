import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../services/api_service.dart';
import '../widgets/custom_toast.dart';
import 'add_mistake_sentence.dart';

/// Implemetation of `Analyse Text` button. it sent data from [myController] to API
/// by [postText] and add received data to [sentences].
Future<void> analyseTextButton({context, myController, sentences}) async {
  SmartDialog.showLoading();
  sentences.clear();
  try {
    for (var e in (await postText(
      text: myController.controller.text,
      context: context,
    ))) {
      addSentence(e, sentences);
    }
  } catch (e) {
    SmartDialog.showToast('', alignment: Alignment.bottomCenter,
        builder: (context) {
      return const CustomToast(
        msg: 'Failed to fetch data from API',
        type: ToastType.error,
      );
    });
  }
  SmartDialog.dismiss();
}
