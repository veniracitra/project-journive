import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:journive_app/menu.dart';
import 'package:journive_app/models/notes_card.dart';
import 'package:journive_app/notes.dart';
import 'package:journive_app/screens/add_note.dart';

class NotesStyle {
  static Color bgColor = Color(0xffB8E8FC);
  //Membuat tema warna pada card notes
  static List<Color> cardsColor = [
    Color(0xffECEAE5),
    Color(0xff669AAF),
    Color(0xffC8FFD4),
    Color(0xff735BF2),
    Color(0xff6765B8),
    Color(0xff79957F),
  ];
  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle mainContent =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal);
}

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesStyle.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        elevation: 0.0,
        title: Text(
          'My Journal',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w900, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC8FFD4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Journals',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Notes')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    //check koneksi state
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {}, note))
                            .toList(),
                      );
                    }
                    return Text(
                      "There's no journals",
                      style: GoogleFonts.roboto(color: Colors.black),
                    );
                  },
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNote()));
        },
        label: Text('New Journal'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
