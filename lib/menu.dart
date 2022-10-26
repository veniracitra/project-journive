import 'package:flutter/material.dart';
import 'package:journive_app/models/notes_item.dart';
import 'package:journive_app/notes.dart';
import 'package:journive_app/todo.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffB8E8BFC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffC8FFD4),
        centerTitle: true,
        title: Text(
          'JOURNIVE',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('images/journivelogo.png'),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Center(
            child: Container(
              width: 320,
              height: 32,
              child: Text(
                'HELLO,',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 320,
              height: 32,
              child: Text(
                'WELCOME TO JOURNIVE!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '"Start Your Day With Your Awesome Planner"',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: 232,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Notes();
                      }));
                    },
                    child: Text('My Journey'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffB1AFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60))),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 232,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MyTodo();
                      }));
                    },
                    child: Text('My To-Do'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffB1AFFF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
