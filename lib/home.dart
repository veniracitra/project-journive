import 'package:flutter/material.dart';
import 'package:journive_app/menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffB8E8FC),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Container(
              width: 320,
              height: 320,
              child: Image.asset('images/journive.png'),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: 96,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Menu();
                  }));
                },
                child: Text(
                  'START',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffB1AFFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
