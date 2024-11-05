import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

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
             Tab(icon: Icon(Icons.home), text: '적재'),
             Tab(icon: Icon(Icons.favorite), text: '하선'),
             Tab(icon: Icon(Icons.person), text: '환적'),
           ],
        ),
      ),
      )
    );

  }


}