import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/upload_file_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix My Exglish',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/upload_file': (context) =>  UploadFilePage(),
      },
    );
  }
}
