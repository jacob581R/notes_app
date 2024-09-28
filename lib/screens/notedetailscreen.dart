import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/screens/editnote.dart';

class NoteDetailScreen extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());
  final TextEditingController titletextfieldvalue = TextEditingController();
  final TextEditingController contenttextfieldvalue = TextEditingController();
  final Note note;
  final int itsNumber;
  NoteDetailScreen({super.key, required this.note, required this.itsNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNote(
                  title: note.title,
                  content: note.content,
                  itsNumber: itsNumber),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              child: Text(
                note.content,
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
