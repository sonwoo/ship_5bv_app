import 'package:flutter/material.dart';

class CustomAelrtPopup extends StatelessWidget {

  final String title;
  final String message;

  const CustomAelrtPopup({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
             title: Text(title),
             content: Text(message),
             actions: [
               TextButton(onPressed: () => Navigator.of(context).pop(),child: Text("닫기"))
             ],
           );
  }

}



