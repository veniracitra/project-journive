import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:journive_app/menu.dart';
import 'package:journive_app/models/notes_item.dart';

class NoteReader extends StatefulWidget {
  NoteReader(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  @override
  Widget build(BuildContext context) {
    int idcolor = widget.doc['idcolor'];
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
                  return Menu();
                }));
              },
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ))
        ],
        backgroundColor: NotesStyle.cardsColor[idcolor],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc['ntitle'],
              style: NotesStyle.mainTitle,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.doc['ndate'],
              style: NotesStyle.mainTitle,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.doc['ncontent'],
              style: NotesStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
// class Notes extends StatefulWidget {
//   _Notes createState() => _Notes();
// }

// class _Notes extends State<Notes> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         appBar: AppBar(
//           leading: Container(
//             padding: EdgeInsets.all(5),
//             child: Image.asset('images/journivelogo.png'),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) {
//                     return Menu();
//                   }));
//                 },
//                 icon: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                 ))
//           ],
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(0xffC8FFD4),
//           centerTitle: true,
//           title: Text(
//             'My Journal',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 'JOURNAL',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
//               ),
//               SizedBox(
//                 height: 480,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) {
//                       return CreateNotes();
//                     }));
//                   },
//                   style: ElevatedButton.styleFrom(primary: Color(0xffB1AFFF)),
//                   child: Text(
//                     "Add To-Do",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ))
//             ],
//           ),
//         ));
//   }
// }

// class CreateNotes extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Color(0xff93C6DB),
//       appBar: AppBar(
//         leading: Container(
//           padding: EdgeInsets.all(5),
//           child: Image.asset('images/journivelogo.png'),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) {
//                   return Notes();
//                 }));
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ))
//         ],
//         automaticallyImplyLeading: false,
//         backgroundColor: Color(0xffC8FFD4),
//         centerTitle: true,
//         title: Text(
//           'My Journal',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 8,
//             ),
//             Center(
//               child: Container(
//                 width: 368,
//                 height: 640,
//                 color: Color(0xff699AAE),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
