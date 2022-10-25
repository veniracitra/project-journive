import 'package:flutter/material.dart';
import 'package:journive_app/splashscreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
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