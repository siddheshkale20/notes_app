import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:notes_app/EditView.dart';
import 'package:notes_app/SideMenu.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/CreateNote.dart';
import 'package:notes_app/model/Model.dart';
import 'package:notes_app/services/db.dart';
import 'NoteView.dart';
import 'SearchPage.dart';
import 'package:intl/intl.dart';
String note="SQL is the standard language for Relation Database System. ";
String note1="SQL is the standard language for Relation Database System. All relational database management systems like MySQL,";
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  bool isLoading=false;
  late List<Note> noteList;
  GlobalKey<ScaffoldState> _drawerKey =GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllNotes();
  }
  Future createEntry(Note note) async{
    await NotesDatabase.inst.created(note);
  }
  Future getAllNotes() async
  {
    this.noteList= (await NotesDatabase.inst.readAllNotes())!;
    setState(() {
      isLoading=false;
    });
  }
  Future getOneNote(int id) async{
    await NotesDatabase.inst.readOneNote(id);
  }
  Future getUpdateNote(Note note) async{
    await NotesDatabase.inst.updateNode(note);
  }
  Future getdeleteNode(int id) async{
    await NotesDatabase.inst.deleteNode(id);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(backgroundColor:bgColor,body: Center(
      child: CircularProgressIndicator(color: white,),
    ),): Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNoteView()));
        },
        child: Icon(Icons.add,size: 45,color: Colors.white,),
        backgroundColor: cardColor,
      ),
      endDrawerEnableOpenDragGesture: true,
      key: _drawerKey,
      drawer: SideMenu(),
        backgroundColor: bgColor,
        body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: cardColor,
                                boxShadow: [BoxShadow(color: black.withOpacity(0.2),spreadRadius: 0.2)]
                              ),
                             child: Row(
                               children: [
                                 Row(
                                   children: [
                                     IconButton(onPressed: (){
                                       _drawerKey.currentState!.openDrawer();
                                     }, icon: Icon(Icons.menu,color: Colors.white,)),
                                     SizedBox(width: 20,),
                                     GestureDetector(
                                       onTap: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                                       },
                                       child: Container(
                                         height: 55,
                                         width: 180,
                                         decoration: BoxDecoration(
                                           //border: Border.all(color: Colors.white)
                                         ),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text("Search Your Notes...",style: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 12),)
                                           ],
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     TextButton(
                                         onPressed: (){}, child: Icon(Icons.grid_view,color: Colors.white,),
                                         style: ButtonStyle(
                                           overlayColor: MaterialStateColor.resolveWith((states) => white.withOpacity(0.1)),
                                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                             RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                                           )
                                         ),
                                     ),
                                     CircleAvatar(
                                       backgroundColor: Colors.white,
                                     )

                                   ],
                                 ),
                               ],
                             ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(12, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("All",style: TextStyle(fontSize: 14,color: Colors.white.withOpacity(0.5))),
                                ],
                              ),
                            ),
                            SectionAll(),
                            Container(
                                padding: EdgeInsets.fromLTRB(10,150,0,10),
                                child:
                                StaggeredGridView.countBuilder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: noteList.length,
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                    itemBuilder: (context,index)=>GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView(note:noteList[index])));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.white.withOpacity(0.9)),
                                            borderRadius: BorderRadius.circular(7),
                                            color: index.isEven ? Colors.pinkAccent :Colors.blue
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.only(left: 7),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(noteList[index].title,style:TextStyle(color: white,fontWeight: FontWeight.bold)),
                                              SizedBox(height: 10,),
                                              index.isEven ? Text(note1,style:TextStyle(color: white)) :Text(note,style:TextStyle(color: white))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ), staggeredTileBuilder: (index)=>StaggeredTile.fit(2))
                            ),
                            Sectionbuilder(),
                          ],
                        ),
                      ),
                  ),
                  )
    );
  }
  Widget SectionAll()
  {
    return Container(
        padding: EdgeInsets.fromLTRB(10,20,0,10),
        child:
        StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: noteList.length,
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemBuilder: (context,index)=>InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView(note: noteList[index],)));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(7)
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(noteList[index].title,style:TextStyle(color: white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      noteList[index].content.length>250? Text("${noteList[index].content.substring(0,250)}...",style:TextStyle(color: white)) :Text(noteList[index].content,style:TextStyle(color: white))
                    ],
                  ),
                ),
              ),
            ), staggeredTileBuilder: (index)=>StaggeredTile.fit(2))
    );
  }
  Widget Sectionbuilder()
  {
    return Container(
        padding: EdgeInsets.fromLTRB(10,20,0,10),
        child:
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: noteList.length,
          itemBuilder: (context,index)=>InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteView(note: noteList[index],)));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Container(
                margin: EdgeInsets.only(left: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(noteList[index].title,style:TextStyle(color: white,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    index.isEven ? Text(note1,style:TextStyle(color: white)) :Text(note,style:TextStyle(color: white))
                  ],
                ),
              ),
            ),
          ),)
    );
  }
}
