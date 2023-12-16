import 'package:flutter/material.dart';
import 'package:notes_app/NoteView.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/services/db.dart';
import 'model/Model.dart';
class EditNoteView extends StatefulWidget {
  late Note note;
  EditNoteView({required this.note});
  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  @override
  Widget build(BuildContext context) {
    late String newTitle;
    late String newContent;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: bgColor,
        actions: [
          IconButton(
              splashRadius: 17,
              onPressed: () async{
                print(newTitle);
                Note newNote=Note(id:widget.note.id,pin:false, title: newTitle, content: newContent, createTime: widget.note.createTime);
                await NotesDatabase.inst.updateNode(newNote);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView(note: newNote)));
                
              }, icon: Icon(Icons.save_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Column(
            children: [
              Form(child: TextFormField(
                initialValue: widget.note.title,
                onChanged: (value)
                {
                  newTitle=value;
                },
                cursorColor: white,
                style: TextStyle(fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.withOpacity(0.8))),
              ),),
              Container(
                  height: 300,
                  child: Form(
                    child: TextFormField(
                      initialValue: widget.note.content,
                      onChanged: (value)
                      {
                        newContent=value;
                      },
                      cursorColor: white,
                      keyboardType:  TextInputType.multiline,
                      minLines: 50,
                      maxLines: null,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Note",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.8))),
                    ),
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
