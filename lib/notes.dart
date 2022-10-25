import 'package:flutter/material.dart';
import 'package:journive_app/home.dart';
import 'package:journive_app/menu.dart';

class Notes extends StatefulWidget {
  _Notes createState() => _Notes();
}

class _Notes extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(5),
            child: Image.asset('images/journivelogo.png'),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Menu();
                  }));
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffC8FFD4),
          centerTitle: true,
          title: Text(
            'My Journal',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                'JOURNAL',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 480,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return CreateNotes();
                    }));
                  },
                  style: ElevatedButton.styleFrom(primary: Color(0xffB1AFFF)),
                  child: Text(
                    "Add To-Do",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}

class CreateNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff93C6DB),
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(5),
          child: Image.asset('images/journivelogo.png'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Notes();
                }));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffC8FFD4),
        centerTitle: true,
        title: Text(
          'My Journal',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                width: 368,
                height: 640,
                color: Color(0xff699AAE),
              ),
            )
          ],
        ),
      ),
    );
  }
}
