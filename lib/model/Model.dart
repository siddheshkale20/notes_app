import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class NotesImpNames{
  static final String id="id";
  static final String pin="pin";
  static final String title="title";
  static final String content="content";
  static final String createTime="createTime";
  static final String TableName="Notes";
  static final List<String> val= [id ,pin,title,content,createTime,TableName];

}
class Note{
   final int? id;
   final bool pin;
   final String title;
  final String content;
 final DateTime createTime;
  const Note({required this.pin,required this.id, required this.title,required this.content,required this.createTime});
  static Note fromJson(Map<String,Object?> json){
    initializeDateFormatting('en_US', null);
    DateTime tempDate= DateFormat.yMd('en_US').parse('1/12/2020');
    return Note( pin : json[NotesImpNames.pin] ==1,id: json[NotesImpNames.id] as int?,
    title: json[NotesImpNames.title] as String,content: json[NotesImpNames.content] as String,createTime: DateTime.parse(json[NotesImpNames.createTime] as String));
  }
  Map<String, Object?> toJson()
  {
    return {
      NotesImpNames.id:id,
     NotesImpNames.pin:pin ? 1 : 0,
      NotesImpNames.content:content,
      NotesImpNames.createTime: createTime.toIso8601String(),
      NotesImpNames.title: title,
      NotesImpNames.TableName: "Notes"
    };
  }
  Note copy({
    int ? id,
    bool? pin,
    String? title,
    String? content,
    DateTime? createTime,
})
  {
    return  Note(id : id?? this.id ,
        pin:pin ?? this.pin,
        title:  title ?? this.title,
        content:  content ?? this.content,
        createTime:  createTime ?? this.createTime
    );
  }

}
