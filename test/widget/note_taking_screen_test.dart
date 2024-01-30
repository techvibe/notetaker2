import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/screens/note_taking_screen.dart'; // Adjust the import path

void main() {
  group('NoteTakingScreen Tests', () {
    testWidgets('Screen should display AppBar with correct title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NoteTakingScreen()));

      expect(find.text('Notes'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    // Test adding a note
    testWidgets('Should be able to add a note', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: NoteTakingScreen()));

      // Assuming an 'Add' button opens a dialog to add a note
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(); // Wait for the dialog to open

      // Fill out the new note form
      await tester.enterText(find.byType(TextField).at(0), 'New Note Title');
      await tester.enterText(find.byType(TextField).at(1), 'New Note Content');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle(); // Wait for the dialog to close

      // Check if the new note is added
      expect(find.text('New Note Title'), findsOneWidget);
    });

    // Additional tests can be added for other functionalities like deleting a note
  });
}
