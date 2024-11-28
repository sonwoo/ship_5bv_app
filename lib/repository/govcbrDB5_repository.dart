import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/model/govcbrDB5_contents_model.dart';


class Govcbrdb5Repository {

  final _dio = Dio();



  Future<List<Govcbrdb5ContentsModel>> getContents({
    required String CORP_ID,
    required String SSD_KEY,
    required String WORK_DIV,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(
      '${API_URL}GOVCBRDB5Content', queryParameters: {
      "CORP_ID" : CORP_ID,
      "SSD_KEY" : SSD_KEY,
      "WORK_DIV" : WORK_DIV,
      "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => Govcbrdb5ContentsModel.fromJson(item)).toList();

  }
  
  Future<String> updateConents(String ssdKey, Govcbrdb5ContentsModel model)
  async {

    final modelString = model.toJson();

    final requestData = {
      "CORP_ID": CORP_ID,
      "WORK_DIV": WORK_DIV,
      "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
      "SSD_KEY": ssdKey,
      "json": modelString, // JSON 데이터를 포함
    };

    final  jsonString = jsonEncode(requestData);

    final resp = await _dio.put('${API_URL}GOVCBRDB5Content', data: jsonString);

    return resp.data.toString();
  }


}