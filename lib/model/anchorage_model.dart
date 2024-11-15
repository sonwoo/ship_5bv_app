class AnchorageModel{

  final String USER_ERP_ID;
  final String PORT_CD;
  final String ANCH_CD;
  final String ANCH_NM;
  final String CUSTOMS_CD;

  AnchorageModel({
    required this.USER_ERP_ID,
    required this.PORT_CD,
    required this.ANCH_CD,
    required this.ANCH_NM,
    required this.CUSTOMS_CD
  });

  AnchorageModel.fromJson({
    required Map<String, dynamic> json,
  })
      : USER_ERP_ID = json['USER_ERP_ID'],
        PORT_CD = json['PORT_CD'],
        ANCH_CD = json['ANCH_CD'],
        ANCH_NM = json['ANCH_NM'],
        CUSTOMS_CD = json['CUSTOMS_CD'];

}