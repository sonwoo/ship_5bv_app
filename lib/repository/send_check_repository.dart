import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/globals.dart';

class SendCheckRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";

  Future<String> checkDoEnd(String SSD_KEY, String SSD_BIZ_GBN)
  async {

    final data = jsonEncode({
      'CORP_ID': CORP_ID,
      'SSD_BIZ_GBN': SSD_BIZ_GBN,
      'PLATFORM': PLATFORM,
      'SSD_KEY': SSD_KEY
    });

    var resp = await _dio.get(_targetUrl, data: data);

    return resp.data.toString();

  }


}