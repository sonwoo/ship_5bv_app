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
          title: const Text('정 박 항'),
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
                child: ElevatedButton(
                  onPressed: () {
                    _performSearch();
                  },
                  child: const Text("   검 색   "),
                )),
            const SizedBox(height: 10),
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
                                      },
                                      child: Text(
                                        '${item.ANCH_NM}', //'정박항:
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                    // TextButton(
                                    //   onPressed: () {
                                    //     AlertDialog(
                                    //       title: Text('알림'),
                                    //       content: Text('삭제하시겠습니까?'),
                                    //       actions: [
                                    //         TextButton(
                                    //           onPressed: () {
                                    //             Navigator.pop(context);
                                    //           },
                                    //           child: Text('취소'),
                                    //         ),
                                    //         TextButton(
                                    //           onPressed: () {
                                    //             // 실제 삭제 로직 구현
                                    //             print('삭제되었습니다.');
                                    //             Navigator.pop(context);
                                    //           },
                                    //           child: Text('확인'),
                                    //         ),
                                    //       ],

                                    //     );
                                    //     //Navigator.pop(context);
                                    //   },
                                    //   child: Text(
                                    //     '${item.ANCH_NM}', //'정박항:
                                    //     style: const TextStyle(
                                    //       fontSize: 15,
                                    //       fontWeight: FontWeight.bold,
                                    //       overflow: TextOverflow.ellipsis,
                                    //     ),
                                    //   ),
                                    // ),
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
