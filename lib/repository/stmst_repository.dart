import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/model/stmst_model.dart';
import 'package:dio/dio.dart';

class StmstRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/AgentCompanyList";

  Future<List<StmstModel>> getStmstList({
    required String CORP_ID,
    required int SELECT_VALUE,
    required String SEARCH_WORDS,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(_targetUrl, queryParameters: {
      "CORP_ID" : CORP_ID,
      "SELECT_VALUE" : SELECT_VALUE,
      "SEARCH_WORDS" : SEARCH_WORDS,
      "PLATFORM" : PLATFORM,
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => StmstModel.fromJson(item)).toList();

  }


}