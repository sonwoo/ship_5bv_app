import 'dart:async';
import 'dart:convert';
import 'package:ship_5bv_app/model/govcbr5JI_model.dart';
import 'package:dio/dio.dart';

class Govcbr5jiRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/GOVCBR5JIList";

  Future<List<Govcbr5jiModel>> getGovcbr5jiList({
    required String CORP_ID,
    required String START_SIN_DAY,
    required String END_SIN_DAY,
    required int SELECT_VALUE,
    required String SEARCH_WORDS,
    required String PLATFORM,
  }) async {
        final resp = await _dio.get(_targetUrl, queryParameters: {
          "CORP_ID" : CORP_ID,
          "START_SIN_DAY" : START_SIN_DAY,
          "END_SIN_DAY" : END_SIN_DAY,
          "SELECT_VALUE" : SELECT_VALUE,
          "SEARCH_WORDS" : SEARCH_WORDS,
          "PLATFORM" : PLATFORM,
          },);

        List<dynamic> jsonData = jsonDecode(resp.toString());

        return jsonData.map((item) => Govcbr5jiModel.fromJson(item)).toList();

      }

  }


