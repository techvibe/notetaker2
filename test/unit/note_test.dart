import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/note.dart'; // Replace with your actual import path

void main() {
  group('Note Model Tests', () {
    test('should create a valid note object', () {
      final note = Note(title: 'Test Title', content: 'Test Content');

      expect(note.title, 'Test Title');
      expect(note.content, 'Test Content');
    });
  });
}
