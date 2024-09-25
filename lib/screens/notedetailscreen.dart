import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/models/note.dart';

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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //controller.editNote(
          //titletextfieldvalue.text, contenttextfieldvalue.text, itsNumber);

          Get.back();
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title),
            SizedBox(height: 20),
            Expanded(child: Text(note.content))
          ],
        ),
      ),
    );
  }
}
