import 'package:flutter/material.dart';
import 'package:journive_app/menu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color(0xffB8E8FC),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bgjournive.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Menu();
                }));
              },
              child: Text(
                'START',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Color(0xffB1AFFF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
            ),
          ),
        )
        // Center(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 160,
        //       ),
        //       Container(
        //         child: Image.asset(
        //           'images/bgjournive.png',
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 16,
        //       ),
        //       SizedBox(
        //         width: 96,
        //         height: 32,
        //         child: ElevatedButton(
        //           onPressed: () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) {
        //   return Menu();
        // }));
        //           },
        // child: Text(
        //   'START',
        //   style: TextStyle(
        //       fontWeight: FontWeight.bold, color: Colors.black),
        // ),
        // style: ElevatedButton.styleFrom(
        //     primary: Color(0xffB1AFFF),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(60))),
        //   ),
        // )
        //     ],
        //   ),
        // ),
        );
  }
}
