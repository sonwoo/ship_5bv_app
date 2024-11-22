import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/govcbrDB6_contents_model.dart';


class Govcbrdb6Repository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";


  Future<List<Govcbrdb6ContentsModel>> getContents({
    required String CORP_ID,
    required String SSD_KEY,
    required String WORK_DIV,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(
      '${_targetUrl}GOVCBRDB6Content', queryParameters: {
      "CORP_ID" : CORP_ID,
      "SSD_KEY" : SSD_KEY,
      "WORK_DIV" : WORK_DIV,
      "PLATFORM" : PLATFORM,
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => Govcbrdb6ContentsModel.fromJson(item)).toList();

  }
  
  Future<String> updateConents(String ssdKey, Govcbrdb6ContentsModel model)
  async {

    final modelString = model.toJson();

    final requestData = {
      "CORP_ID": CORP_ID,
      "WORK_DIV": WORK_DIV,
      "PLATFORM": PLATFORM,
      "SSD_KEY": ssdKey,
      "json": modelString, // JSON 데이터를 포함
    };

    final  jsonString = jsonEncode(requestData);

    final resp = await _dio.put('${_targetUrl}GOVCBRDB6Content', data: jsonString);

    return resp.data.toString();
  }


}