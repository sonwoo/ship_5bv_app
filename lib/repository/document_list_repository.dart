import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/model/document_list_model.dart';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';

class DocumentListRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";

  Future<List<DocumentListModel>> getDocumentList({
    required String CORP_ID,
    required String START_SIN_DAY,
    required String END_SIN_DAY,
    required int SELECT_VALUE,
    required String SEARCH_WORDS,
    required String PLATFORM,
    required String docdiv,
  }) async {
        final resp = await _dio.get(
          _targetUrl + docdiv, queryParameters: {
          "CORP_ID" : CORP_ID,
          "START_SIN_DAY" : START_SIN_DAY,
          "END_SIN_DAY" : END_SIN_DAY,
          "SELECT_VALUE" : SELECT_VALUE,
          "SEARCH_WORDS" : SEARCH_WORDS,
          "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : PLATFORM,
          },);

        List<dynamic> jsonData = jsonDecode(resp.toString());

        return jsonData.map((item) => DocumentListModel.fromJson(item)).toList();

      }


  }


