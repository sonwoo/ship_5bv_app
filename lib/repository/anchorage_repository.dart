import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/anchorage_model.dart';
import 'package:dio/dio.dart';


class AnchorageRepository  {
  final _dio = Dio();
  final _targetUrl = "${API_URL}AnchorList";

  Future<List<AnchorageModel>> getAnchorageList({
    required String CORP_ID,
    required String CUSTOMS_CD,
    required String SEARCH_WORDS,
    required String SEARCH_WORDS2,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(_targetUrl, queryParameters: {
      "CORP_ID": CORP_ID,
      "CUSTOMS_CD": CUSTOMS_CD,
      "SEARCH_WORDS": SEARCH_WORDS,
      "SEARCH_WORDS2": SEARCH_WORDS2,
      "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => AnchorageModel.fromJson(item)).toList();
  }

}