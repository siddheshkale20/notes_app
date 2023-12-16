
import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';
import 'Settings.dart';
import 'ArchiveView.dart';
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    Widget sectionone()
    {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child:TextButton(onPressed: (){}, child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.lightbulb_outline,color: Colors.white,size: 30,),
              SizedBox(width:10,),
              Text("Notes",style: TextStyle(color: Colors.white,fontSize:13),),
            ],
          ),
        ),
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange.withOpacity(0.5)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              )
          ),),
      );
    }
    Widget sectiontwo()
    {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child:TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArchiveViewNote()));
        }, child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.archive,color: Colors.white,size: 30,),
              SizedBox(width:10,),
              Text("Archive",style: TextStyle(color: Colors.white,fontSize:13),),
            ],
          ),
        ),
          style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent.withOpacity(0.1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              )
          ),),
      );
    }



    Widget sectionthree()
    {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child:TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsView()));
        }, child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.settings,color: Colors.white,size: 30,),
              SizedBox(width:10,),
              Text("Settings",style: TextStyle(color: Colors.white,fontSize:13),),
            ],
          ),
        ),
          style: ButtonStyle(
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.orangeAccent.withOpacity(0.1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
              )
          ),),
      );
    }

    return Drawer(
      child:SafeArea(
     child: Container(
       decoration: BoxDecoration(color: bgColor),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 10,),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
               child: Text("Notes Keep",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
           Divider(
             color: white.withOpacity(0.2),
           ),
           sectionone(),
           SizedBox(height: 10,),
           sectiontwo(),
           SizedBox(height: 10,),
           sectionthree(),
         ],
       ),
     ),
    ));

  }
}
