import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/model/govcbr5JI_contents_model.dart';


class Govcbr5jiRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";


  Future<List<Govcbr5jiContentsModel>> getContents({
    required String CORP_ID,
    required String SSD_KEY,
    required String WORK_DIV,
    required String PLATFORM,
  }) async {
    final resp = await _dio.get(
      '${_targetUrl}GOVCBR5JIContent', queryParameters: {
      "CORP_ID" : CORP_ID,
      "SSD_KEY" : SSD_KEY,
      "WORK_DIV" : WORK_DIV,
      "PLATFORM" : PLATFORM,
    },);

    List<dynamic> jsonData = jsonDecode(resp.toString());

    return jsonData.map((item) => Govcbr5jiContentsModel.fromJson(item)).toList();

  }


}