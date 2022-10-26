import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journive_app/models/notes_item.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: NotesStyle.cardsColor[doc['idcolor']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['ntitle'],
            style: NotesStyle.mainTitle,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            doc['ndate'],
            style: NotesStyle.mainTitle,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            doc['ncontent'],
            style: NotesStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
