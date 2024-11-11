import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/govcbr5JI_contents.dart';


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
      body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5.0,
              color: Colors.white54
            )
          ),
          child:  Column(
          children: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                const Text('신고일자'),
                const SizedBox( height: 30, width: 30,),
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
                const Icon(Icons.accessibility_new),
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
            const SizedBox(height: 10,),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
                Text('제출번호'),
                SizedBox( height: 30, width: 30,),
                SizedBox(
                  width: 250, // 원하는 너비 설정
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white54,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
                Text('선박이름'),
                SizedBox( height: 30, width: 30,),
                SizedBox(
                  width: 250, // 원하는 너비 설정
                  height: 35,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white54,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 10,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => const Govcbr5jiContents()),);
                },
                child: const Text("   검 색   "),)),
          ],
        ),
     )

    );
  }

}