
String CORP_ID = "";
String PLATFORM = "";
String WORK_DIV = "";
String COMPANY_NO = "";
const String API_URL = "http://stomnet.kr/service/api/";
//const String API_URL = "http://192.168.200.38:3000/api/";

List<selectedSearch> selectedSearches =
[ selectedSearch('GOVCBR5JIList', DateTime.now().subtract(const Duration(days: 6)), DateTime.now(), '','',true),
  selectedSearch('GOVCBRDB5List', DateTime.now().subtract(const Duration(days: 6)), DateTime.now(), '','',true),
  selectedSearch('GOVCBRDB6List', DateTime.now().subtract(const Duration(days: 6)), DateTime.now(), '','',true) ];

class selectedSearch
{
  String name;
  DateTime start_date;
  DateTime end_date;
  String searchValue1;
  String searchValue2;
  bool statusH;

  selectedSearch(this.name, this.start_date, this.end_date, this.searchValue1, this.searchValue2, this.statusH);
}