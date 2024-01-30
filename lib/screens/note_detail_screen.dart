import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(note.content),
      ),
    );
  }
}
