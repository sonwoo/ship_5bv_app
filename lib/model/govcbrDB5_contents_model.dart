class Govcbrdb5ContentsModel {

  String USER_ERP_ID;
  String? SSD_F_GBN;
  String? SSD_MSG_GI2;
  String? SSD_RPT_DAY;
  String? SSD_DB7_DAY;
  String? SSD_DB7_HM;
  String? SSD_SE;
  String? SSD_JUNGBAK_COD;
  String? TMPPORT_CD;
  String? WORK_DIV;
  String? END_SND_CHK;
  String? SSD_ROLE_DIV;
  String? SSD_AGNT_CD;
  String? SSD_AGNT_MK;
  String? SSD_AGNT_NM;
  String? SSD_DAE_CD;
  String? SSD_DAE_MK;
  String? SSD_DAE_NM;
  String? SSD_SIN_CD;
  String? SSD_SIN_MK;
  String? SSD_SIN_NM;

  Govcbrdb5ContentsModel({
    required this.USER_ERP_ID,
    required this.SSD_F_GBN,
    required this.SSD_MSG_GI2,
    required this.SSD_RPT_DAY,
    required this.SSD_DB7_DAY,
    required this.SSD_DB7_HM,
    required this.SSD_JUNGBAK_COD,
    required this.TMPPORT_CD,
    required this.WORK_DIV,
    required this.END_SND_CHK,
    required this.SSD_ROLE_DIV,
    required this.SSD_AGNT_CD,
    required this.SSD_AGNT_MK,
    required this.SSD_AGNT_NM,
    required this.SSD_DAE_CD,
    required this.SSD_DAE_MK,
    required this.SSD_DAE_NM,
    required this.SSD_SIN_CD,
    required this.SSD_SIN_MK,
    required this.SSD_SIN_NM,
    required this.SSD_SE});

  factory Govcbrdb5ContentsModel.fromJson(Map<String, dynamic> json) {
    return Govcbrdb5ContentsModel(
      USER_ERP_ID :  json['USER_ERP_ID'] ?? "",
      SSD_F_GBN : json['SSD_F_GBN'] ?? "",
      SSD_MSG_GI2 : json['SSD_MSG_GI2'] ?? "",
      SSD_RPT_DAY : json['SSD_RPT_DAY'] ?? "",
      SSD_DB7_DAY : json['SSD_DB7_DAY'] ?? "",
      SSD_DB7_HM : json['SSD_DB7_HM'] ?? "",
      SSD_SE : json['SSD_SE'] ?? "",
      SSD_JUNGBAK_COD : json['SSD_JUNGBAK_COD'] ?? "",
      TMPPORT_CD : json['TMPPORT_CD'] ?? "",
      WORK_DIV : json['WORK_DIV'] ?? "",
      END_SND_CHK : json['END_SND_CHK'] ?? "",
      SSD_ROLE_DIV : json['SSD_ROLE_DIV'] ?? "",
      SSD_AGNT_CD : json['SSD_AGNT_CD'] ?? "",
      SSD_AGNT_MK : json['SSD_AGNT_MK'] ?? "",
      SSD_AGNT_NM : json['SSD_AGNT_NM'] ?? "",
      SSD_DAE_CD : json['SSD_DAE_CD'] ?? "",
      SSD_DAE_MK : json['SSD_DAE_MK'] ?? "",
      SSD_DAE_NM : json['SSD_DAE_NM'] ?? "",
      SSD_SIN_CD : json['SSD_SIN_CD'] ?? "",
      SSD_SIN_MK : json['SSD_SIN_MK'] ?? "",
      SSD_SIN_NM : json['SSD_SIN_NM'] ?? "",
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'SSD_MSG_GI2': SSD_MSG_GI2,
      'SSD_F_GBN': SSD_F_GBN,
      'SSD_RPT_DAY': SSD_RPT_DAY,
      'SSD_DB7_DAY': SSD_DB7_DAY,
      'SSD_DB7_HM': SSD_DB7_HM,
      'SSD_SE': SSD_SE,
      'SSD_JUNGBAK_COD': SSD_JUNGBAK_COD,
      'TMPPORT_CD': TMPPORT_CD,
      'SSD_ROLE_DIV': SSD_ROLE_DIV,
      'SSD_AGNT_CD': SSD_AGNT_CD,
      'SSD_AGNT_MK': SSD_AGNT_MK,
      'SSD_AGNT_NM': SSD_AGNT_NM,
      'SSD_DAE_CD': SSD_DAE_CD,
      'SSD_DAE_MK': SSD_DAE_MK,
      'SSD_DAE_NM': SSD_DAE_NM,
      'SSD_SIN_CD': SSD_SIN_CD,
      'SSD_SIN_MK': SSD_SIN_MK,
      'SSD_SIN_NM': SSD_SIN_NM,
    };
  }


}