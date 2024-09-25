import 'package:get_storage/get_storage.dart';

import '../models/note.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  final storage = GetStorage();
  final String key = 'notes';

  // save notes
  void saveNote(List<Note> notes) {
    List<Map<String, dynamic>> jsonList =
        notes.map((obj) => obj.toJson()).toList();
    // Store the list of maps in GetStorage
    storage.write(key, jsonList);
  }

// retrieve notes
  List<Note> getNotes() {
    // Get the stored list of maps (jsonList)
    List<dynamic>? jsonList = storage.read<List<dynamic>>(key);
    // Convert each map in the jsonList back to a MyObject using fromJson
    if (jsonList != null) {
      return jsonList
          .map((json) => Note.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    // Return an empty list if no data is found
    return [];
  }

// add note
  void addNote(String title, String content) async {
    List<Note> currentNotes = getNotes();
    currentNotes.add(Note(title: title, content: content));
    saveNote(currentNotes);
    update();
  }

// delete note
  void deleteNote(int index) {
    List<Note> currentNotes = getNotes();
    currentNotes.removeAt(index);
    saveNote(currentNotes);
    update();
  }

// edit note
  void editNote(String title, String content, int index) {
    List<Note> currentNotes = getNotes();
    Note newNote = Note(title: title, content: content);
    currentNotes[index] = newNote;
    saveNote(currentNotes);
    update();
  }
}
