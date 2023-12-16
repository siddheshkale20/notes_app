import 'package:flutter/material.dart';
import 'package:notes_app/colors.dart';
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
       backgroundColor: bgColor,
        title: Text("Settings",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Sync",style: TextStyle(color: white,fontSize: 20),),
                Spacer(),
                Transform.scale(
                  scale: 1.3,
                  child: new Switch.adaptive(activeColor: Colors.white,splashRadius: 30, value: value, onChanged: (switchValue){
                    setState(() {
                      this.value=switchValue;
                    });
                  }),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
