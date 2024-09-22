import '../models/note.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  List<Note> notes = [
    Note(title: 'title1', content: 'content1'),
    Note(title: 'title2', content: 'content2'),
    Note(title: 'title3', content: 'content3'),
    Note(title: 'title4', content: 'content4'),
  ];

// add note
  void addNote(String title, String content) {
    notes.add(Note(title: title, content: content));
    update();
  }

// delete note
  void deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

// edit note
  void editNote(String title, String content, int index) {
    notes[index].title = title;
    notes[index].content = content;
    update();
  }
}
