import 'package:flutter/material.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/stmst_model.dart';
import 'package:ship_5bv_app/repository/stmst_repository.dart';

class StmstScreen extends StatefulWidget {
  const StmstScreen({super.key});
  @override
  _StmstScreenState createState() => _StmstScreenState();
}

class _StmstScreenState extends State<StmstScreen> {
  final StmstRepository _stmstrepository = StmstRepository();
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  List<StmstModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          title: const Text(
            '대리인 업체',
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
                decoration: const InputDecoration(
                  hintText: "상호를 입력하세요",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white54,
                ),
              ),
            ),
            const SizedBox(
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
                    backgroundColor: const Color.fromRGBO(53, 80, 161, 1.0), // 버튼 글자색
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // 버튼 모서리 둥글게 만들기
                    ),
                  ),
                  child: const Text(
                    "   검      색   ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )),
            const SizedBox(height: 5),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
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
                                    Text(
                                      '사업자 번호: ${item.ETPR_NO}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('상호: ${item.CUST_NM}'),
                                    Text('대표자: ${item.RPST_NM}'),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.pop(context, {
                                    'SSD_AGNT_CD': item.CUST_CD,
                                    'SSD_AGNT_MK': item.SUPL_CD,
                                    'SSD_AGNT_NM': item.CUST_NM
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

    final results = await _stmstrepository.getStmstList(
        CORP_ID: CORP_ID,
        SELECT_VALUE: 1,
        SEARCH_WORDS: _searchController.text,
        PLATFORM: PLATFORM);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }
}
