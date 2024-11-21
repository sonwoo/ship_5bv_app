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
          toolbarHeight: 40,
          title: const Text(
            '정 박 항',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "정박항을 입력하세요",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white54,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _performSearch();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(53, 80, 161, 1.0), // 버튼 글자색
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // 버튼 모서리 둥글게 만들기
                    ),
                  ),
                  child: const Text(
                    "   검      색   ",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )),
            const SizedBox(height: 5),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: _searchResults.length, // 카드뷰 갯수
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
                                    GestureDetector(
                                      onTap: () {
                                        if ('${item.ANCH_NM}'.length >= 15) {
                                          // 임의의 너비 값

                                          showDialog(
                                            context: context, // 빌드 컨텍스트를 전달
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  '정박항',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                content: Text(
                                                  '${item.ANCH_NM}',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          Navigator.pop(context, {
                                            'SSD_SE': item.CUSTOMS_CD,
                                            'SSD_JUNGBAK_COD': item.ANCH_CD,
                                            'TMPPORT_CD': item.PORT_CD
                                          });
                                        }
                                        ;
                                      },
                                      child: Text(
                                        '${item.ANCH_NM}', //'정박항:
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          //overflow: TextOverflow.ellipsis,
                                        ),

                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('항구부호: ${item.PORT_CD}'),
                                    Text('세관: ${item.CUSTOMS_CD}'),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context, {
                                    'SSD_SE': item.CUSTOMS_CD,
                                    'SSD_JUNGBAK_COD': item.ANCH_CD,
                                    'TMPPORT_CD': item.PORT_CD
                                  });
                                },
                              ),
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
        ));
  }

  void _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    final results = await _anchoragerepository.getAnchorageList(
        CORP_ID: CORP_ID,
        CUSTOMS_CD: '',
        SELECT_VALUE: 1,
        SEARCH_WORDS: _searchController.text,
        PLATFORM: PLATFORM);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }
}
