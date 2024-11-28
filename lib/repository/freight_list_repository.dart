import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/freight_list_model.dart';

class FreightListRepository {

  final _dio = Dio();

  Future<List<FreightListModel>> getFreightList({
    required String CORP_ID,
    required String SSD_KEY,
    required String PLATFORM,
    required String docdiv,
  }) async {
    final resp = await _dio.get(
      API_URL + docdiv, queryParameters: {
      "CORP_ID" : CORP_ID,
      "SSD_KEY" : SSD_KEY,
      "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => FreightListModel.fromJson(item)).toList();

  }


}
