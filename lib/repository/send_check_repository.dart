import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/globals.dart';

class SendCheckRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";

  Future<String> checkDoEnd(String SSD_KEY, String SSD_BIZ_GBN , bool Send)
  async {

    String ret = "";

    var resp = await _dio.get('${_targetUrl}CheckDoEnd', queryParameters:{'CORP_ID': CORP_ID, 'SSD_BIZ_GBN': SSD_BIZ_GBN,'PLATFORM': PLATFORM,'SSD_KEY': SSD_KEY  } );

    List<dynamic> jsonData = jsonDecode(resp.toString());

    if (jsonData.isNotEmpty)
    {
        if(jsonData[0]["MSG_ERR"] != null) {
          ret = jsonData[0]["MSG_ERR"];
        }else {
          if(Send) {
            ret = jsonData[0]["RESULT"];
          } else {
            ret = "정보가 저장 되었습니다.";
          }
        }
    }
    else {
      ret = "오류 검증에 실패 하였습니다.";
    }

    return ret;

  }


}