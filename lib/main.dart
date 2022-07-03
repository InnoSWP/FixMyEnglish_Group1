import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';
import './pages/home_page.dart';
import './pages/upload_file_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Fix My Exglish',
          initialRoute: '/',
          navigatorObservers: [FlutterSmartDialog.observer],
          routes: {
            '/': (context) => const HomePage(),
            '/upload_file': (context) =>  UploadFilePage(),
          },
          builder: FlutterSmartDialog.init(),
        );
      }
    );
  }
}
