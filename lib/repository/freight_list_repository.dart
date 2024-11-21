import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/model/freight_list_model.dart';

class FreightListRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";

  Future<List<FreightListModel>> getDocumentList({
    required String CORP_ID,
    required String SSD_KEY,
    required String PLATFORM,
    required String docdiv,
  }) async {
    final resp = await _dio.get(
      _targetUrl + docdiv, queryParameters: {
      "CORP_ID" : CORP_ID,
      "SSD_KEY" : SSD_KEY,
      "PLATFORM" : PLATFORM,
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => FreightListModel.fromJson(item)).toList();

  }


}
