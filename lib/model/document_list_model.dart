
class DocumentListModel {

  final String TMPSSD_KEY;
  final String SSD_USERID;
  final String SSD_SUN_NAME;
  final String WORK_DIV;
  final String SND_CHK;
  final String TMPSSD_FD_GBN;
  final String SSD_SIN_SANGHO;
  final String SSD_DAE_NM;
  final String SSD_BO_SANGHO;
  final String SSD_SIN_DAY;
  final String TMPSSD_SND_GBN;
  final String TMPSSD_SND_GBN2;
  final String TMPSSD_SND_GBN3;

  DocumentListModel({
    required this.TMPSSD_KEY,
    required this.SSD_USERID,
    required this.SSD_SUN_NAME,
    required this.WORK_DIV,
    required this.SND_CHK,
    required this.TMPSSD_FD_GBN,
    required this.SSD_SIN_SANGHO,
    required this.SSD_BO_SANGHO,
    required this.SSD_DAE_NM,
    required this.SSD_SIN_DAY,
    required this.TMPSSD_SND_GBN,
    required this.TMPSSD_SND_GBN2,
    required this.TMPSSD_SND_GBN3,
  });

  factory DocumentListModel.fromJson(Map<String, dynamic> json) {
    return DocumentListModel(
        TMPSSD_KEY :  json['TMPSSD_KEY'] ?? "",
        SSD_USERID : json['SSD_USERID'] ?? "",
        SSD_SUN_NAME : json['SSD_SUN_NAME'] ?? "",
        WORK_DIV : json['WORK_DIV'] ?? "",
        SND_CHK : json['SND_CHK'] ?? "",
        TMPSSD_FD_GBN : json['TMPSSD_FD_GBN'] ?? "",
        SSD_SIN_SANGHO : json['SSD_SIN_SANGHO'] ?? "",
        SSD_DAE_NM : json['SSD_DAE_NM'] ?? "",
        SSD_BO_SANGHO : json['SSD_BO_SANGHO'] ?? "",
        SSD_SIN_DAY : json['SSD_SIN_DAY'] ?? "",
        TMPSSD_SND_GBN : json['TMPSSD_SND_GBN'] ?? "",
        TMPSSD_SND_GBN2 : json['TMPSSD_SND_GBN2'] ?? "",
        TMPSSD_SND_GBN3 : json['TMPSSD_SND_GBN3'] ?? ""
    );
  }

}
