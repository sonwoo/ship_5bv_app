import 'package:flutter/material.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/anchorage_model.dart';
import 'package:ship_5bv_app/repository/anchorage_repository.dart';

class Anchorage extends StatefulWidget {
  const Anchorage({super.key});
  @override
  _AnchorageState createState() => _AnchorageState();
}

class _AnchorageState extends State<Anchorage> {
  final AnchorageRepository _anchoragerepository = AnchorageRepository();
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<AnchorageModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('정박항'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "정박항을 입력하세요",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white54,
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  _performSearch();
                },
                  child: const Text("   검 색   "),)),
            const SizedBox(height: 10),
            Expanded(
              child: _isLoading ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: _searchResults.length,  // 카드뷰 갯수
                itemBuilder: (context, index) {
                  final item = _searchResults[index];
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('코드: ${item.ANCH_CD}'),
                              Text('정박항: ${item.ANCH_NM}'),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('항구부호: ${item.PORT_CD}'),
                              Text('세관: ${item.CUSTOMS_CD}'),
                            ],
                          ),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontWeight: FontWeight.bold,),
                                  backgroundColor: Colors.amberAccent),
                              child: const Text('확인'),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            )
          ],
        )
    );
  }


  void _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    final results = await _anchoragerepository.getAnchorageList(
        CORP_ID: CORP_ID,
        CUSTOMS_CD : '',
        SELECT_VALUE: 1,
        SEARCH_WORDS: _searchController.text,
        PLATFORM: PLATFORM);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });

  }

}