class Govcbr6dbContentsModel {

  String USER_ERP_ID;
  String? SSD_F_GBN;
  String? SSD_MSG_GI2;
  String? SSD_RPT_DAY;
  String? SSD_5BV_DAY;
  String? SSD_5BV_HM;
  String? SSD_HA_DAY;
  String? SSD_HA_HM;
  String? SSD_CRG_NM;
  String? SSD_SE;
  String? SSD_JUNGBAK_COD;
  String? TMPPORT_CD;
  String? WORK_DIV;
  String? END_SND_CHK;
  String? SSD_ROLE_DIV;
  String? SSD_AGNT_CD;
  String? SSD_AGNT_MK;
  String? SSD_AGNT_NM;

  Govcbr6dbContentsModel({
    required this.USER_ERP_ID,
    required this.SSD_F_GBN,
    required this.SSD_MSG_GI2,
    required this.SSD_RPT_DAY,
    required this.SSD_5BV_DAY,
    required this.SSD_5BV_HM,
    required this.SSD_HA_DAY,
    required this.SSD_HA_HM,
    required this.SSD_CRG_NM,
    required this.SSD_JUNGBAK_COD,
    required this.TMPPORT_CD,
    required this.WORK_DIV,
    required this.END_SND_CHK,
    required this.SSD_ROLE_DIV,
    required this.SSD_AGNT_CD,
    required this.SSD_AGNT_MK,
    required this.SSD_AGNT_NM ,
    required this.SSD_SE});

  factory Govcbr6dbContentsModel.fromJson(Map<String, dynamic> json) {
    return Govcbr6dbContentsModel(
      USER_ERP_ID :  json['USER_ERP_ID'] ?? "",
      SSD_F_GBN : json['SSD_F_GBN'] ?? "",
      SSD_MSG_GI2 : json['SSD_MSG_GI2'] ?? "",
      SSD_RPT_DAY : json['SSD_RPT_DAY'] ?? "",
      SSD_5BV_DAY : json['SSD_5BV_DAY'] ?? "",
      SSD_5BV_HM : json['SSD_5BV_HM'] ?? "",
      SSD_HA_DAY : json['SSD_HA_DAY'] ?? "",
      SSD_HA_HM : json['SSD_HA_HM'] ?? "",
      SSD_CRG_NM : json['SSD_CRG_NM'] ?? "",
      SSD_SE : json['SSD_SE'] ?? "",
      SSD_JUNGBAK_COD : json['SSD_JUNGBAK_COD'] ?? "",
      TMPPORT_CD : json['TMPPORT_CD'] ?? "",
      WORK_DIV : json['WORK_DIV'] ?? "",
      END_SND_CHK : json['END_SND_CHK'] ?? "",
      SSD_ROLE_DIV : json['SSD_ROLE_DIV'] ?? "",
      SSD_AGNT_CD : json['SSD_AGNT_CD'] ?? "",
      SSD_AGNT_MK : json['SSD_AGNT_MK'] ?? "",
      SSD_AGNT_NM : json['SSD_AGNT_NM'] ?? "",
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'SSD_MSG_GI2': SSD_MSG_GI2,
      'SSD_F_GBN': SSD_F_GBN,
      'SSD_RPT_DAY': SSD_RPT_DAY,
      'SSD_5BV_DAY': SSD_5BV_DAY,
      'SSD_5BV_HM': SSD_5BV_HM,
      'SSD_HA_DAY': SSD_HA_DAY,
      'SSD_HA_HM': SSD_HA_HM,
      'SSD_SE': SSD_SE,
      'SSD_JUNGBAK_COD': SSD_JUNGBAK_COD,
      'TMPPORT_CD': TMPPORT_CD,
      'SSD_CRG_NM': SSD_CRG_NM,
      'SSD_ROLE_DIV': SSD_ROLE_DIV,
      'SSD_AGNT_CD': SSD_AGNT_CD,
      'SSD_AGNT_MK': SSD_AGNT_MK,
      'SSD_AGNT_NM': SSD_AGNT_NM,
    };
  }


}