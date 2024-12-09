import 'package:flutter/material.dart';
import 'package:ship_5bv_app/screen/document_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            toolbarHeight: 45,
            //backgroundColor: Colors.amber,
            backgroundColor: const Color.fromRGBO(53, 80, 161, 1.0),
            title: const FittedBox(
              child: Text(
                '선박용품 이행착수(완료) 보고',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize (
            preferredSize: const Size.fromHeight(40.0),
             child:  TabBar(
              splashFactory: NoSplash.splashFactory,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.white, width: 3.0),
                gradient: const LinearGradient(
                  //배경 그라데이션 적용
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              labelColor: const Color.fromRGBO(53, 80, 161, 1.0),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              indicatorColor: const Color.fromRGBO(53, 80, 161, 1.0),
              indicatorWeight: 3.0,
              tabs: const <Widget>[
                Tab(
                    child: Text('적   재',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ))),
                Tab(
                    child: Text('하   선',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ))),
                Tab(
                    child: Text('환   적',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        ))),
              ],
            ),
           ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: _tabs,
          ),
        ));
  }
}
