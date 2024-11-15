import 'package:flutter/material.dart';

class Anchorage extends StatefulWidget {
  const Anchorage({super.key});
  @override
  _AnchorageState createState() => _AnchorageState();
}

class _AnchorageState extends State<Anchorage> {
  final List<String> comments = <String>[
    '최신 음악 무제한',
    '뮤직비디오 무제한',
    '음악 라이브러리 공유',
    '뮤직비디오 업로드',
    '뮤직비디오 공유 무제한'
  ];

  final List<IconData> icons = <IconData>[
    Icons.music_note,
    Icons.music_video,
    Icons.library_music,
    Icons.videocam,
    Icons.video_library
  ];

  final List<String> wons = <String>[
    "5,000",
    "7,000",
    "9,000",
    "10,000",
    "15,000",
  ];

  DateTime start_date = DateTime.now().subtract(const Duration(days: 6));
  DateTime end_date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar
          AppBar(title: Text('코드')),
          // 상단 Container
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5.0, color: Colors.white54)),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(15)),
                    const Text('신고일자'),
                    const SizedBox(
                      height: 30,
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: start_date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          locale: const Locale('ko', 'KR'),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            start_date = selectedDate;
                          });
                        }
                      },
                      child: Text(
                          "${start_date.year.toString()}-${start_date.month.toString().padLeft(2, '0')}-${start_date.day.toString().padLeft(2, '0')}"),
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
                          locale: const Locale('ko', 'KR'),
                        );
                        if (selectedDate != null) {
                          setState(() {
                            end_date = selectedDate;
                          });
                        }
                      },
                      child: Text(
                          "${end_date.year.toString()}-${end_date.month.toString().padLeft(2, '0')}-${end_date.day.toString().padLeft(2, '0')}"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Padding(padding: EdgeInsets.all(15)),
                    Text('제출번호'),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
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
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Padding(padding: EdgeInsets.all(15)),
                    Text('선박이름'),
                    SizedBox(
                      height: 30,
                      width: 30,
                    ),
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Govcbr5jiContents()),
                        // );
                      },
                      child: const Text("   검 색   "),
                    )),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(8),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          icons[index],
                          color: Colors.redAccent,
                        ),
                        title: Text('${comments[index]}'),
                        subtitle: Text(
                          '가격 : ${wons[index]} 원',
                        ),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          TextButton(
                            child: Text('확인'),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                backgroundColor: Colors.amberAccent),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
