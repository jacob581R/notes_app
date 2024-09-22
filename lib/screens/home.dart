import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/screens/addnote.dart';
import '../screens/notedetailscreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNote());
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder(
          init: NoteController(),
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              controller.deleteNote(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                        tileColor: Colors.black45,
                        contentPadding: EdgeInsets.all(8),
                        title: Text(controller.notes[index].title),
                        subtitle: Text(controller.notes[index].content),
                        enabled: true,
                        horizontalTitleGap: 50,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteDetailScreen(
                                  note: controller.notes[index],
                                  its_number: index),
                            ),
                          );
                        }),
                  );
                });
          }),
    );
  }
}
