import 'package:flutter/material.dart';

class CustomPopupButtons extends StatelessWidget {
  final String title;
  final String name;
  final Widget type;
  final ValueChanged<Map<String, String>> onSelected;

  const CustomPopupButtons(
      {super.key,
      required this.title,
      required this.type,
      required this.name,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        FocusScope.of(context).unfocus();

        final result = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: type,
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStateProperty.all(Colors.white), // 글자 색상

                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return const Color.fromRGBO(
                                  53, 80, 161, 1.0); //눌렀을때.. 색
                            }
                            return const Color.fromRGBO(53, 80, 161, 1.0);
                          },
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            // side: BorderSide(
                            //     color: Colors.black, width: 1), // 테두리 설정
                            borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                          ),
                        ),
                      ),
                      child: const Text(
                        "닫기",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ))
                ],
              );
            });
        if (result != null) {
          onSelected(result);
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromRGBO(53, 80, 161, 1.0), // 테두리 색상 변경
              width: 1.0, // 테두리 두께
            ),
            borderRadius: BorderRadius.circular(10.0), // 모서리 둥글게 만들기
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            color: Color.fromRGBO(53, 80, 161, 1.0), // 글자 색상
            fontWeight: FontWeight.bold, // 굵기
            fontSize: 15, // 글자 크기
          ),
        ),
      ),
      child: Text(name),
    );
  }
}
