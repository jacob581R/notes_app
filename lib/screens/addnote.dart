import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controllers/themeservice.dart';

import '../controllers/notecontroller.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  final NoteController controller = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.addNote(titleController.text, contentController.text);
          Get.back();
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: TextStyle(fontSize: 24),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "Title"),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: contentController,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "content"),
            ),
          ],
        ),
      ),
    );
  }
}
