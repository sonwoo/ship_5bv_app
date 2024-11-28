import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/anchorage_model.dart';
import 'package:dio/dio.dart';


class AnchorageRepository  {
  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/AnchorList";

  Future<List<AnchorageModel>> getAnchorageList({
    required String CORP_ID,
    required String CUSTOMS_CD,
    required int SELECT_VALUE,
    required String SEARCH_WORDS,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(_targetUrl, queryParameters: {
      "CORP_ID": CORP_ID,
      "CUSTOMS_CD": CUSTOMS_CD,
      "SELECT_VALUE": SELECT_VALUE,
      "SEARCH_WORDS": SEARCH_WORDS,
      "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => AnchorageModel.fromJson(item)).toList();
  }

}