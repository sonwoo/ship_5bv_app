import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/model/document_list_model.dart';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';

class DocumentListRepository {

  final _dio = Dio();

  Future<List<DocumentListModel>> getDocumentList({
    required String CORP_ID,
    required String START_SIN_DAY,
    required String END_SIN_DAY,
    required String SEARCH_WORDS,
    required String SEARCH_WORDS2,
    required bool STATUS,
    required String PLATFORM,
    required String docdiv,
  }) async {
        final resp = await _dio.get(
          API_URL + docdiv, queryParameters: {
          "CORP_ID" : CORP_ID,
          "START_SIN_DAY" : START_SIN_DAY,
          "END_SIN_DAY" : END_SIN_DAY,
          "SEARCH_WORDS" : SEARCH_WORDS,
          "SEARCH_WORDS2" : SEARCH_WORDS2,
          "STATUS": STATUS,
          "PLATFORM" : PLATFORM == "CS" ? COMPANY_NO : "EDI",
          },);

        List<dynamic> jsonData = jsonDecode(resp.toString());

        return jsonData.map((item) => DocumentListModel.fromJson(item)).toList();

      }


  }


