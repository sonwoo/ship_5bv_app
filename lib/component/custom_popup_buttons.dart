import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/anchorage_screen.dart';
import 'package:ship_5bv_app/screen/stmst_screen.dart';

class CustomPopupButtons extends StatelessWidget {
  final String title;
  final String name;
  final Widget type;
  final ValueChanged<Map<String, String>> onSelected;

  const CustomPopupButtons(
      {super.key, required this.title, required this.type, required this.name , required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: EdgeInsets.fromLTRB(0, 80, 0, 80),
                //title: Text(title),
                content: type,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStateProperty.all(Colors.black), // 글자 색상
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.black, width: 1), // 테두리 설정
                            borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                          ),
                        ),
                      ),
                      child: Text("닫기"))
                ],
              );
            });
        if(result != null) {
          onSelected(result);
        }
      },
      child: Text(name),
    );
  }
}
