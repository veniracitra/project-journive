import 'dart:async';
import 'package:flutter/material.dart';
import 'package:journive_app/home.dart';

class Splashscreen extends StatefulWidget {
  _Splashscreen createState() => _Splashscreen();
}

class _Splashscreen extends State<Splashscreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffB1AFFF),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 128,
            ),
            Container(
              width: 320,
              height: 320,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              child: Text(
                'JOURNIVE',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
