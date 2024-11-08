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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코드'),
      ),
      body: ListView.separated(
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
                        textStyle: TextStyle(fontWeight: FontWeight.bold,),
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
    );
  }
}