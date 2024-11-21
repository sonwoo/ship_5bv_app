
class FreightListModel {

  String? SSD_CAR_NO;
  String? SSD_PUM_NO;
  String? SSD_PUM01;
  String? SSD_ETC_SU;
  String? SSD_KG;
  String? SSD_GUMAK;

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
        SSD_ETC_SU : json['SSD_ETC_SU'] ?? "",
        SSD_KG : json['SSD_KG'] ?? "",
        SSD_GUMAK : json['SSD_GUMAK'] ?? "",
    );
  }


}