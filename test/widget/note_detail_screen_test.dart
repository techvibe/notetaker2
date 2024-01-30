import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/note.dart';
import '../../lib/screens/note_detail_screen.dart'; // Adjust the import path

void main() {
  group('NoteDetailScreen Tests', () {
    testWidgets('Should display note title and content', (WidgetTester tester) async {
      final note = Note(title: 'Test Note', content: 'This is the note content.');

      await tester.pumpWidget(MaterialApp(home: NoteDetailScreen(note: note)));

      expect(find.text('Test Note'), findsOneWidget);
      expect(find.text('This is the note content.'), findsOneWidget);
    });

    // More tests can be added to ensure the UI behaves as expected
  });
}
