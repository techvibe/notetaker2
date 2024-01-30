import 'dart:io';

import 'package:flutter/material.dart';
import 'note_detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import '../models/note.dart';

class NoteTakingScreen extends StatefulWidget {
  @override
  _NoteTakingScreenState createState() => _NoteTakingScreenState();
}

class _NoteTakingScreenState extends State<NoteTakingScreen> {
  final List<Note> _notes = [];

  void _addNewNote() {
    _displayAddNoteDialog();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Use the image.path where you need it
    }
  }

  void _displayAddNoteDialog() async {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _contentController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(hintText: "Content"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  _notes.add(Note(
                    title: _titleController.text,
                    content: _contentController.text,
                  ));
                  _titleController.clear();
                  _contentController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
            // Add a button or icon to allow image picking
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: _pickImage,
            ),
          ],
        );
      },
    );
  }

  void _viewNote(Note note) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NoteDetailScreen(note: note)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_notes[index].title),
            // Display the image if it exists
            leading: _notes[index].imagePath != null
                ? Image.file(File(_notes[index].imagePath!))
                : null,
            onTap: () => _viewNote(_notes[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _notes.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewNote,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
