import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/anchorage_screen.dart';
import 'package:ship_5bv_app/screen/stmst_screen.dart';

class CustomPopupButtons extends StatelessWidget {

  final String title;
  final String name;
  final Widget type;

  const CustomPopupButtons({super.key, required this.title, required this.type, required this.name});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
       onPressed: () {
         showDialog(
             barrierDismissible: true,
             context: context,
             builder: (BuildContext context) {
             return AlertDialog(
              insetPadding: EdgeInsets.fromLTRB(0,80,0, 80),
              title: Text(title),
              content: type,
               actions: [
                 TextButton(onPressed: () {
                   Navigator.of(context).pop();
                 }, child: Text("닫기"))
               ],
             );
           }
         );
       },
       child: Text(name),
     );
  }



}