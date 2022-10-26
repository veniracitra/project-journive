import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:journive_app/models/notes_item.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  int idcolor = Random().nextInt(NotesStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotesStyle.cardsColor[idcolor],
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
                  return Notes();
                }));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))
        ],
        backgroundColor: NotesStyle.cardsColor[idcolor],
        elevation: 0.0,
        title: Text(
          'Create New Journal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              style: NotesStyle.mainTitle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: NotesStyle.dateTitle,
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline, maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Write Journey",
              ),
              //style: ,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection('Notes').add({
            'ntitle': _titleController,
            'ndate': date,
            'ncontent': _mainController.text,
            'idcolor': idcolor
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print('Failed To Add New Journal due to $error'));
        },
        backgroundColor: NotesStyle.bgColor,
        child: Icon(Icons.save),
      ),
    );
  }
}
