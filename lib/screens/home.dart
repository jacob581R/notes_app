import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notesapp/controllers/themeservice.dart';
import 'package:notesapp/controllers/notecontroller.dart';
import 'package:notesapp/models/note.dart';
import 'package:notesapp/screens/addnote.dart';
import '../screens/notedetailscreen.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final _themeService = ThemeService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        //backgroundColor: Colors.blue,
        //foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              _themeService.switchTheme();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNote());
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder(
          init: NoteController(),
          builder: (controller) {
            List<Note> notes = controller.getNotes();
            return ListView.builder(
                itemCount: notes.length,
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
                              color: Color(0xffB8001F),
                            )),
                        contentPadding: EdgeInsets.all(8),
                        title: Text(
                          notes[index].title,
                          style: TextStyle(fontSize: 24),
                        ),
                        subtitle: Text(
                          maxLines: 1,
                          notes[index].content,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        enabled: true,
                        horizontalTitleGap: 50,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteDetailScreen(
                                  note: controller.getNotes()[index],
                                  itsNumber: index),
                            ),
                          );
                        }),
                  );
                });
          }),
    );
  }
}
