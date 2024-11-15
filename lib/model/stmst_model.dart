class StmstModel{

  final String USER_ERP_ID;
  final String CUST_CD;
  final String SUPL_CD;
  final String ETPR_NO;
  final String RPST_NM;
  final String CUST_NM;

  StmstModel({
    required this.USER_ERP_ID,
    required this.CUST_CD,
    required this.SUPL_CD,
    required this.ETPR_NO,
    required this.RPST_NM,
    required this.CUST_NM
  });

  StmstModel.fromJson({
    required Map<String, dynamic> json,
  })
      : USER_ERP_ID = json['USER_ERP_ID'],
        CUST_CD = json['CUST_CD'],
        SUPL_CD = json['SUPL_CD'],
        ETPR_NO = json['ETPR_NO'],
        RPST_NM = json['RPST_NM'],
        CUST_NM = json['CUST_NM'];

}