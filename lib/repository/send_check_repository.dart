import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ship_5bv_app/globals.dart';

class SendCheckRepository {

  final _dio = Dio();
  final _targetUrl = "http://192.168.200.38:3000/api/";

  Future<String> checkDoEnd(String ssdKey, String ssdBizGbn , bool Send)
  async {

    String ret = "";

    var resp = await _dio.get('${_targetUrl}CheckDoEnd', queryParameters:{'CORP_ID': CORP_ID, 'SSD_BIZ_GBN': ssdBizGbn,'PLATFORM': PLATFORM,'SSD_KEY': ssdKey  } );

    List<dynamic> jsonData = jsonDecode(resp.toString());

    if (jsonData.isNotEmpty)
    {
        if(jsonData[0]["MSG_ERR"] != null && jsonData[0]["MSG_ERR"].toString() != "") {
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


  Future<String> Send(String ssdKey, String ssdBizGbn , String ssdBizGbn2)
  async  {

    String ret = "";
    String Table = "";
    if(ssdBizGbn == "2") {
      Table = "CUSSSD5JI_2_M";
    } else if (ssdBizGbn == "3") {
      Table = "CUSSSD5JI_3_M";
    } else {
      Table = "CUSSSD5JI_4_M";
    }

    var resp = await _dio.get('${_targetUrl}Send',
        queryParameters:{'CORP_ID': CORP_ID,'SSD_BIZ_GBN': ssdBizGbn, 'SSD_KEY': ssdKey,  'SSD_F_GBN2': ssdBizGbn2 ,'TABLE_M': Table,'WORK_DIV':WORK_DIV , 'PLATFORM': PLATFORM} );

    List<dynamic> jsonData = jsonDecode(resp.toString());

    if (jsonData.isNotEmpty)
    {
      ret = jsonData[0]["RESULT"];
    }

    return ret;
  }

}