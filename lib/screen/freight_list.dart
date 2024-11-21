import 'package:flutter/material.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/freight_list_model.dart';
import 'package:ship_5bv_app/repository/freight_list_repository.dart';

class FreightList  extends StatefulWidget{
  const FreightList({super.key});

  @override
  _FreightListState createState() => _FreightListState();

}
class _FreightListState extends State<FreightList> {

  final FreightListRepository _freightListRepository = FreightListRepository();
  bool _isLoading = false;
  List<FreightListModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: _isLoading ? Center(child: CircularProgressIndicator())
          : ListView.separated(
            itemCount: _searchResults.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _searchResults[index];
              return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('화물관리 번호: ${item.SSD_CAR_NO}'),
                              Text('품목번호: ${item.SSD_PUM_NO}'),
                              Text('품명: ${item.SSD_PUM01}'),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('수량: ${item.SSD_ETC_SU}'),
                              Text('중량: ${item.SSD_KG}'),
                              Text('금액: ${item.SSD_GUMAK}'),
                            ],
                          ),
                        ),
                      ]
                  ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            ),
          ),

        );
  }

  void _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    final results = await _freightListRepository.getFreightList(
      CORP_ID: CORP_ID,
      SSD_KEY:  "",
      PLATFORM: PLATFORM,
      docdiv: "" //widget.docdiv,
    );

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });

  }

}