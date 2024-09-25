import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/notecontroller.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});
  final NoteController controller = Get.put(NoteController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Note"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
