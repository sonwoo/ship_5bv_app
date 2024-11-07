import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/auth_screen.dart';
import 'package:ship_5bv_app/screen/document_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  final List<Widget> _tabs = [
    DocumentList(),
    DocumentList(),
    DocumentList()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('선용품 이행 완료 보고'),
          centerTitle: true,
          bottom: const TabBar(
             tabs: [
               Tab(text: '적재'),
               Tab(text: '하선'),
               Tab(text: '환적'),
             ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _tabs,
        ),
      )
    );

  }


}