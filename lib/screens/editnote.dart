import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/screens/home.dart';

class EditNote extends StatelessWidget {
  final controller = Get.put(NoteController());
  final String title;
  final String content;
  final int itsNumber;
  EditNote(
      {super.key,
      required this.title,
      required this.content,
      required this.itsNumber});
  @override
  Widget build(BuildContext context) {
    TextEditingController titlevalue = TextEditingController(text: title);
    TextEditingController contentvalue = TextEditingController(text: content);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              controller.editNote(
                  titlevalue.text, contentvalue.text, itsNumber);
              Get.off(() => Home());
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titlevalue,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: "title",
              ),
            ),
            TextField(
              style: TextStyle(fontSize: 18),
              controller: contentvalue,
              textAlign: TextAlign.start,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: "content",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
