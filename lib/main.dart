import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/fix_text_page.dart';
import './pages/upload_file_page.dart';
import './pages/test_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix My Exglish',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/test': (context) => const TestPage(),
        '/fix_text': (context) => const FixTextPage(),
        '/upload_file': (context) => const UploadFilePage(),
      },
    );
  }
}
