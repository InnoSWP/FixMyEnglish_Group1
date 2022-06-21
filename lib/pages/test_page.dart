import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../utilities/manage_sentence.dart';


class TestPage extends StatelessWidget {
  static const pageName = '/test';

  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> l = getSentence(
      text: 'aaab12131b12r1b3\\b',
      error: 'b',
      context: context,
      suggestion: 'some suggestion',
    );

    return Scaffold(
      appBar: getAppBar(),
      body: Row(
        children: [...l],
      ),
    );
  }
}
