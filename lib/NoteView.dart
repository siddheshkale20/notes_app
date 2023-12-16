import 'package:flutter/material.dart';
import 'colors.dart';
import 'EditView.dart';
import 'model/Model.dart';
String note="SQL is the standard language for Relation Database System. ";
class NoteView extends StatefulWidget {
  late Note note;
  NoteView({required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: (){}, icon: Icon(Icons.push_pin_outlined,color: Colors.white,)),
          IconButton(
              splashRadius: 17,
              onPressed: (){}, icon: Icon(Icons.archive_outlined,color: Colors.white)),
          IconButton(
              splashRadius: 17,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditNoteView(note:widget.note)));
              }, icon: Icon(Icons.edit_outlined,color: Colors.white))
        ],
      ),
    body: Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.note.title,style: TextStyle(color: white,fontSize: 23,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(widget.note.content,style: TextStyle(color: white,)),

        ],
      ),
    ),
    );
  }
}
