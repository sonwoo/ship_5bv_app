
import 'dart:ffi';

class FreightListModel {

  String? SSD_CAR_NO;
  String? SSD_PUM_NO;
  String? SSD_PUM01;
  double? SSD_ETC_SU;
  double? SSD_KG;
  double? SSD_GUMAK;

  FreightListModel({
    this.SSD_CAR_NO,
    this.SSD_PUM_NO,
    this.SSD_PUM01,
    this.SSD_ETC_SU,
    this.SSD_KG,
    this.SSD_GUMAK,});

  factory FreightListModel.fromJson(Map<String, dynamic> json) {
    return FreightListModel(
        SSD_CAR_NO :  json['SSD_CAR_NO'] ?? "",
        SSD_PUM_NO : json['SSD_PUM_NO'] ?? "",
        SSD_PUM01 : json['SSD_PUM01'] ?? "",
        SSD_ETC_SU: (json['SSD_ETC_SU'] as num?)?.toDouble() ?? 0.0, // 수정: toDouble()으로 변환
        SSD_KG: (json['SSD_KG'] as num?)?.toDouble() ?? 0.0, // 수정: toDouble()으로 변환
        SSD_GUMAK: (json['SSD_GUMAK'] as num?)?.toDouble() ?? 0.0, // 수정: toDouble()으로 변환

    );
  }


}