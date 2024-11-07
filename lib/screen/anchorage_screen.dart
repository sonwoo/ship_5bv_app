import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnchorageCard extends StatelessWidget {
  final Anchorage anchora;

  const AnchorageCard({Key? key, required this.anchora}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          //backgroundImage: NetworkImage(Anchorage.imageUrl),
        ),
        title: Text('a'),
        subtitle: Text('a'),
        onTap: () {
          // 상세 정보 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  child: Center(
                    child: Text('내용'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Anchorage {
  final String name;
  Anchorage(
      {required this.name});
}
