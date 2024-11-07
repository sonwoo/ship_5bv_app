import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_text_field.dart';


class DocumentList extends StatefulWidget{

  const DocumentList({super.key});

  @override
  State<StatefulWidget> createState()  => _DocumentList();

}

class _DocumentList extends State<DocumentList>{

  DateTime start_date = DateTime.now().subtract(const Duration(days: 6));
  DateTime end_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  height: 30,
                  width: 60,
                  child: Text('신고일자'),
                ),
                SizedBox( height: 30, width: 30,),
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: start_date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      locale: const Locale('ko','KR'),
                    );
                    if(selectedDate != null){
                      setState(() {
                        start_date = selectedDate;
                      });
                    }
                  },
                  child: Text("${start_date.year.toString()}-${start_date.month.toString().padLeft(2, '0')}-${start_date.day.toString().padLeft(2, '0')}"),
                ),
                Icon(Icons.accessibility_new),
                ElevatedButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: end_date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      locale: const Locale('ko','KR'),
                    );
                    if(selectedDate != null){
                      setState(() {
                        end_date = selectedDate;
                      });
                    }
                  },
                  child: Text("${end_date.year.toString()}-${end_date.month.toString().padLeft(2, '0')}-${end_date.day.toString().padLeft(2, '0')}"),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  height: 30,
                  width: 60,
                  child: Text('제출번호'),
                ),
                SizedBox( height: 30, width: 30,),
                Container(
                  width: 250, // 원하는 너비 설정
                  height: 35,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white54,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  height: 30,
                  width: 60,
                  child: Text('선박이름'),
                ),
                SizedBox( height: 30, width: 30,),
                Container(
                  width: 250, // 원하는 너비 설정
                  height: 35,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white54,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {  },
            child: Text("   검 색   "),),
          ],
        ),

    );
  }

}