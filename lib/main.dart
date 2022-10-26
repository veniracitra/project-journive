import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:journive_app/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Journal',
      theme: ThemeData(backgroundColor: Color(0xffB1AFFF)),
      home: Splashscreen(),
    );
  }
}
