import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/document_list.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  final List<Widget> _tabs = [
    const DocumentList(docdiv: 'GOVCBR5JIList'),
    const DocumentList(docdiv: 'GOVCBRDB5List'),
    const DocumentList(docdiv: 'GOVCBRDB6List')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
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
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs,
        ),
      )
    );

  }


}