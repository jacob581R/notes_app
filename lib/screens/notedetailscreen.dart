import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/models/note.dart';

class NoteDetailScreen extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());
  TextEditingController titletextfieldvalue = TextEditingController();
  TextEditingController contenttextfieldvalue = TextEditingController();
  Note note;
  int its_number;
  NoteDetailScreen({required this.note, required this.its_number});
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
          controller.editNote(
              titletextfieldvalue.text, contenttextfieldvalue.text, its_number);
          Get.back();
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titletextfieldvalue,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: note.title),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contenttextfieldvalue,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: note.content),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
