import 'package:flutter/material.dart';

class CustomPopupButtons extends StatelessWidget {

  final String title;
  final String type;

  const CustomPopupButtons({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
     return ElevatedButton(
       onPressed: () {
         showDialog(
             context: context,
           builder: (BuildContext context) {
             return AlertDialog(
              title: Text(title),
               actions: [
                 TextButton(onPressed: () {
                   Navigator.of(context).pop();
                 }, child: Text("닫기"))
               ],
             );
           }
         );
       },
       child: null,
     );
  }


}