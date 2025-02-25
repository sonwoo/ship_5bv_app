import 'package:flutter/material.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/document_list_model.dart';
import 'package:ship_5bv_app/repository/document_list_repository.dart';
import 'package:ship_5bv_app/screen/govcbr5JI_contents.dart';
import 'package:ship_5bv_app/screen/govcbrDB5_contents.dart';
import 'package:ship_5bv_app/screen/govcbrDB6_contents.dart';

class DocumentList extends StatefulWidget {
  final String docdiv;

  const DocumentList({super.key, required this.docdiv});

  @override
  State<StatefulWidget> createState() => _DocumentList();
}

class _DocumentList extends State<DocumentList> {
  final TextEditingController _searchController1 = TextEditingController();
  final TextEditingController _searchController2 = TextEditingController();

  final DocumentListRepository _documentListRepository =
      DocumentListRepository();
  List<DocumentListModel> _searchResults = [];

  bool _isStatusH = false;
  bool _isLoading = false;

  DateTime start_date = DateTime.now().subtract(const Duration(days: 6));
  DateTime end_date = DateTime.now();

  @override
  void initState() {
    super.initState();

    var search = _getSearch();
    start_date = search!.start_date;
    end_date = search.end_date;
    _isStatusH = search.statusH;
    _searchController1.text = search.searchValue1;
    _searchController2.text = search.searchValue2;

    _performSearch();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus(); // 키보드 닫기
      },
    child:  Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.white54)),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width * 0.2, // 원하는 너비 설정
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '신고일자',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: start_date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            locale: const Locale('ko', 'KR'),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              start_date = selectedDate;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        ),
                        child: Text(
                            "${start_date.year.toString()}-${start_date.month.toString().padLeft(2, '0')}-${start_date.day.toString().padLeft(2, '0')}",
                        ),
                      ),
                    ),
                    const Text(
                      ' ~ ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial',
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: ElevatedButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: end_date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            locale: const Locale('ko', 'KR'),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              end_date = selectedDate;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        ),
                        child: Text(
                            "${end_date.year.toString()}-${end_date.month.toString().padLeft(2, '0')}-${end_date.day.toString().padLeft(2, '0')}",
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.1, // 원하는 너비 설정
                      height: 35,
                      child: Checkbox(
                        value: _isStatusH,
                        onChanged: (bool? value) {
                          setState(() {
                            _isStatusH = value!;
                          });
                        },
                      ),
                    ),
                    const Text('허가'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width * 0.2, // 원하는 너비 설정
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '선박이름',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width * 0.27, // 원하는 너비 설정
                      height: 35,
                      child: TextField(
                        controller: _searchController1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white54,
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        ),
                        style: const TextStyle(fontSize: 16), // 텍스트 크기 설정
                        cursorHeight: 18, // 커서 높이를 텍스트 크기와 동일하게 설정
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.2, // 원하는 너비 설정
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '신청업체',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width:
                      MediaQuery.of(context).size.width * 0.27, // 원하는 너비 설정
                      height: 35,
                      child: TextField(
                        controller: _searchController2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white54,
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        ),
                        style: const TextStyle(fontSize: 16), // 텍스트 크기 설정
                        cursorHeight: 18, // 커서 높이를 텍스트 크기와 동일하게 설정
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                        var searchItem = _getSearch();
                        searchItem?.start_date = start_date;
                        searchItem?.end_date = end_date;
                        searchItem?.searchValue1 = _searchController1.text;
                        searchItem?.searchValue2 = _searchController2.text;
                        searchItem?.statusH = _isStatusH;

                        _performSearch();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromRGBO(53, 80, 161, 1.0), // 버튼 글자색
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 버튼 모서리 둥글게 만들기
                        ),
                      ),
                      child: const Text(
                        "검    색   (새로고침)",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                          //color: Color.fromRGBO(53, 80, 161, 1.0),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final item = _searchResults[index];
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '제출번호: ${item.TMPSSD_KEY}',
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('선명: ${item.SSD_SUN_NAME}'),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: const Align(
                                            //alignment: Alignment.centerRight,
                                            child: Text('상태:')),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(item.TMPSSD_SND_GBN)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('신고일자: ${item.SSD_SIN_DAY}'),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: const Align(child: Text('이행:')),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                item.TMPSSD_SND_GBN3)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('대행업체: ${item.SSD_DAE_NM}'),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: const Align(child: Text('완료:')),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                                item.TMPSSD_SND_GBN2)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () async {
                                switch (widget.docdiv) {
                                  case "GOVCBR5JIList":
                                   final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Govcbr5jiContents(
                                                  docNo: item.TMPSSD_KEY,
                                                )));

                                    if (result != null) {
                                      setState(() {
                                        _performSearch();
                                      });
                                    }
                                    break;
                                  case "GOVCBRDB5List":
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Govcbrdb5Contents(
                                                  docNo: item.TMPSSD_KEY,
                                                )));

                                    if (result != null) {
                                      setState(() {
                                        _performSearch();
                                      });
                                    }
                                    break;
                                  case "GOVCBRDB6List":
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Govcbrdb6Contents(
                                                  docNo: item.TMPSSD_KEY,
                                                )));

                                    if (result != null) {
                                      setState(() {
                                        _performSearch();
                                      });
                                    }

                                    break;
                                }
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
          ),
        ],
      ),
      /*
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        height: 50,
        child: const Center(
          child: Text(
            '부산시 동구 중앙대로 240(초량동)현대해상빌딩 6층\nTel.051-966-7000 Fax.051-966-8000',
            style: TextStyle(
              fontSize: 13, // 글자 크기를 24로 설정
              fontWeight: FontWeight.bold, // 글자 굵게
            ),
          ),
        ),
      ),
      */
    ),
    );
  }

  void _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    final results = await _documentListRepository.getDocumentList(
      CORP_ID: CORP_ID,
      START_SIN_DAY: start_date.toString(),
      END_SIN_DAY: end_date.toString(),
      SEARCH_WORDS: _searchController1.text,
      SEARCH_WORDS2:_searchController2.text,
      STATUS : _isStatusH,
      PLATFORM: PLATFORM,
      docdiv: widget.docdiv,
    );

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  selectedSearch? _getSearch()
  {
    for (var search in selectedSearches) {
      if (search.name == widget.docdiv) {
        return search;
      }
    }
    return null;
  }

}


