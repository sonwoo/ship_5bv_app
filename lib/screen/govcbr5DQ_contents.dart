import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_popup_buttons.dart';
import 'package:ship_5bv_app/component/custom_text_field.dart';
import 'package:ship_5bv_app/model/govcbr5DQ_contents_model.dart';
import 'package:ship_5bv_app/repository/govcbr5DQ_repository.dart';
import 'package:ship_5bv_app/repository/send_check_repository.dart';
import 'package:ship_5bv_app/screen/stmst_screen.dart';
import 'package:ship_5bv_app/screen/anchorage_screen.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:intl/intl.dart';
import 'package:ship_5bv_app/util.dart';
import 'package:ship_5bv_app/const/colors.dart';
import 'package:ship_5bv_app/screen/freight_list.dart';

class Govcbr5dqContents extends StatefulWidget {
  final String docNo;

  const Govcbr5dqContents({super.key, required this.docNo});

  @override
  State<Govcbr5dqContents> createState() => _Govcbr5jiContents();
}

class _Govcbr5jiContents extends State<Govcbr5dqContents> {
  final Govcbr5dqRepository _govcbr5dqRepository = Govcbr5dqRepository();
  final SendCheckRepository _sendCheckRepository = SendCheckRepository();

  List<Govcbr5dqContentsModel> _contentsModel = [];
  Govcbr5dqContentsModel? item;
  String initDate =
      '${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';


  final TextEditingController txtSSD_5BV_HM = TextEditingController();

  final TextEditingController txtSSD_BWH_NM = TextEditingController();
  final TextEditingController txtSSD_VEHICLE_NO = TextEditingController();
  final TextEditingController txtSSD_CRG_NM = TextEditingController();

  final TextEditingController txtSSD_JUNGBAK_COD = TextEditingController();
  final TextEditingController txtSSD_SE = TextEditingController();
  final TextEditingController txtTMPPORT_CD = TextEditingController();
  final TextEditingController txtTMPPORT_NM = TextEditingController();

  final TextEditingController txtSSD_AGNT_CD = TextEditingController();
  final TextEditingController txtSSD_AGNT_MK = TextEditingController();
  final TextEditingController txtSSD_AGNT_NM = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getContents();

  }

  @override
  void dispose() {
    // TextEditingController 해제

    txtSSD_5BV_HM.dispose();

    txtSSD_BWH_NM.dispose();
    txtSSD_VEHICLE_NO.dispose();
    txtSSD_CRG_NM.dispose();

    txtSSD_SE.dispose();
    txtTMPPORT_CD.dispose();
    txtTMPPORT_NM.dispose();
    txtSSD_JUNGBAK_COD.dispose();
    txtSSD_AGNT_CD.dispose();
    txtSSD_AGNT_MK.dispose();
    txtSSD_AGNT_NM.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 키보드 닫기
      },
      child:  Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false, // 자동 생성되는 뒤로가기 버튼 비활성화
          actions: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                IconButton(
                  //icon: Icon(Icons.assignment_outlined,
                  //icon: Icon(Icons.exit_to_app,
                  icon: const Icon(Icons.output, color: Colors.white, size: 45),
                  onPressed: () {
                    Navigator.pop(context); // 버튼 클릭 시 실행될 코드
                  },
                ),
              ],
            ),
          ],

          backgroundColor: const Color.fromRGBO(53, 80, 161, 1.0),
          title: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: FittedBox(
              alignment: Alignment.bottomCenter,
              child: Text(
                '갈음 ${widget.docNo} ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: item == null
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
          child : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 8),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 25,
                              child: const Text('문서기능',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LABEL_COLOR,
                                ),),
                            ),
                            SizedBox(
                              height: 35,
                              child: Radio<String>(
                                value: '9',
                                groupValue: item!.SSD_MSG_GI2,
                                onChanged: (val) {
                                  setState(() {
                                    item?.SSD_MSG_GI2 = '9';
                                  });
                                },
                              ),
                            ),
                            const Text('9:원본'),
                            SizedBox(
                              width: 50, // 원하는 너비 설정
                              height: 35,
                              child: Radio<String>(
                                value: '35',
                                groupValue: item!.SSD_MSG_GI2,
                                onChanged: (val) {
                                  setState(() {
                                    item?.SSD_MSG_GI2 = '35';
                                  });
                                },
                              ),
                            ),
                            const Text('35:재전송'),
                          ]
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                              child: const Text('보고일자',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LABEL_COLOR,
                                ),),
                            ),
                            SizedBox(
                                width: 100, // 원하는 너비 설정
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                      initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                      locale: const Locale('ko', 'KR'),
                                    );
                                    if (selectedDate != null) {
                                      setState(() {
                                        item?.SSD_RPT_DAY =
                                            DateFormat('yyyy-MM-dd')
                                                .format(selectedDate);
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(40, 30),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    //elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Color.fromRGBO(53, 80, 161, 1.0),
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(item?.SSD_RPT_DAY ?? initDate),
                                )),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                              child: const Text('적재일시',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LABEL_COLOR,
                                ),),
                            ),
                            SizedBox(
                                width: 100, // 원하는 너비 설정
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime.now(),
                                      initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                      locale: const Locale('ko', 'KR'),
                                    );
                                    if (selectedDate != null) {
                                      setState(() {
                                        item?.SSD_5BV_DAY =
                                            DateFormat('yyyy-MM-dd')
                                                .format(selectedDate);
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(40, 30),
                                    minimumSize: Size.zero,
                                    padding: EdgeInsets.zero,
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      // side: BorderSide(color: Colors.red),
                                      side: const BorderSide(
                                        color: Color.fromRGBO(53, 80, 161, 1.0),
                                      ),

                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(item?.SSD_5BV_DAY ?? initDate),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 80, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_5BV_HM,
                                isTime: true,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_5BV_HM = val?.replaceAll(':', '');
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                              width: 5,
                            ),
                            const Text(
                              '(HHMM)',
                              style: TextStyle(
                                fontSize: 12, // 글자 크기를 24로 설정
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 25,
                              child: const Text('보고업체',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LABEL_COLOR,
                                ),),
                            ),
                            SizedBox(
                              height: 35,
                              child: Radio<String>(
                                value: '1',
                                groupValue:  (item?.SSD_ROLE_DIV == null || item!.SSD_ROLE_DIV.toString() == " " || item!.SSD_ROLE_DIV.toString().trim() == "")
                                    ? '1'
                                    : item!.SSD_ROLE_DIV,
                                onChanged: (val) {
                                  setState(() {
                                    item?.SSD_ROLE_DIV = '1';

                                    var biz = item!.SSD_SIN_MK ?? '';
                                    if(biz != '' && biz.length >= 10) {
                                      biz = '${biz.substring(0, 3)}-${biz.substring(3, 5)}-${biz.substring(5)}';
                                    }

                                    txtSSD_AGNT_MK.text = biz;
                                    txtSSD_AGNT_NM.text = item!.SSD_SIN_NM.toString();
                                  });
                                },
                              ),
                            ),
                            const Text('신고인'),
                            SizedBox(
                              width: 50, // 원하는 너비 설정
                              height: 35,
                              child: Radio<String>(
                                value: '2',
                                groupValue:  (item?.SSD_ROLE_DIV == null || item!.SSD_ROLE_DIV.toString() == " " || item!.SSD_ROLE_DIV.toString().trim() == "")
                                    ? '1'
                                    : item!.SSD_ROLE_DIV,
                                onChanged: (val) {
                                  setState(() {
                                    item?.SSD_ROLE_DIV = '2';

                                    var biz = item!.SSD_DAE_MK ?? '';
                                    if(biz != '' && biz.length >= 10) {
                                      biz = '${biz.substring(0, 3)}-${biz.substring(3, 5)}-${biz.substring(5)}';
                                    }

                                    txtSSD_AGNT_MK.text = biz;
                                    txtSSD_AGNT_NM.text = item!.SSD_DAE_NM.toString();
                                  });
                                },
                              ),
                            ),
                            const Text('신고대리인'),
                          ]),

                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                            ),
                            SizedBox(
                              width: 185, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_AGNT_MK,
                                isBizNumber: true,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_AGNT_MK = val?.replaceAll('-', '');
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                            /*
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 70, // 원하는 너비 설정
                              height: 35,
                              child: CustomPopupButtons(
                                title: "거래처",
                                type: const StmstScreen(),
                                name: "조회",
                                onSelected: (result) {
                                  setState(() {
                                    txtSSD_AGNT_MK.text =
                                        result['ETPR_NO'] ?? "";
                                    txtSSD_AGNT_NM.text =
                                        result['SSD_AGNT_NM'] ?? "";
                                  });
                                },
                              ),
                            ),*/
                          ]),

                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                            ),
                            SizedBox(
                              width: 185, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_AGNT_NM,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_AGNT_NM = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                          ]),
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.30, // 원하는 너비 설정
                                  height: 35,
                                  child: CustomPopupButtons(
                                    title: "화물 목록",
                                    type: FreightList(
                                      docno: widget.docNo,
                                      docdiv: "GOVCBR5DQFreightList",
                                    ),
                                    name: "화물 목록",
                                    onSelected: (result) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.30, // 원하는 너비 설정
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      formKey.currentState!.save();
                                      var ret = await _govcbr5dqRepository
                                          .updateConents(widget.docNo, item!);

                                      if (ret.toString() == "OK") {
                                        showCustomAlertPopup(
                                            context, "", "저장 되었습니다.");
                                      } else {
                                        showCustomAlertPopup(
                                            context, "", "정보를 저장할 수 없습니다.");
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: Color.fromRGBO(
                                                53, 80, 161, 1.0), // 테두리 색상 변경
                                            width: 1.0, // 테두리 두께
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10.0), // 모서리 둥글게 만들기
                                        ),
                                      ),
                                      textStyle:
                                      WidgetStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Color.fromRGBO(
                                              53, 80, 161, 1.0), // 글자 색상
                                          fontWeight: FontWeight.w100, // 굵기
                                          fontSize: 15, // 글자 크기
                                        ),
                                      ),
                                    ),
                                    child: const Text('저   장', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.30, // 원하는 너비 설정
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      formKey.currentState!.save();
                                      var ret = await _govcbr5dqRepository
                                          .updateConents(widget.docNo, item!);

                                      if (ret.toString() == "OK") {
                                        ret = await _sendCheckRepository
                                            .checkDoEnd(
                                            widget.docNo, "5", true);

                                        if (ret.contains("송신")) {
                                          showYesNoDialog(ret);
                                        } else {
                                          showCustomAlertPopup(
                                              context, "", ret);
                                        }
                                      } else {
                                        showCustomAlertPopup(
                                            context, "", "송신할 수 없습니다.");
                                      }
                                    },
                                    style: ButtonStyle(
                                      padding:
                                      WidgetStateProperty.all<EdgeInsets>(
                                        const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                      ),
                                      backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          Colors.white),
                                      shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: Color.fromRGBO(
                                                53, 80, 161, 1.0), // 테두리 색상 변경
                                            width: 1.0, // 테두리 두께
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              10.0), // 모서리 둥글게 만들기
                                        ),
                                      ),
                                      textStyle:
                                      WidgetStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Color.fromRGBO(
                                              53, 80, 161, 1.0), // 글자 색상
                                          fontWeight: FontWeight.w100, // 굵기
                                          fontSize: 15, // 글자 크기
                                        ),
                                      ),
                                    ),
                                    child: const Text('송   신', style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                ),
                              ]),
                          // Expanded(
                          //     child: FreightList(
                          //   docno: widget.docNo,
                          //   docdiv: "GOVCBR5JIFreightList",
                          // ))
                        ],
                      )),
                ),
              )
          ),
        ),
      ),
    );
  }

  void _getContents() async {
    final results = await _govcbr5dqRepository.getContents(
      CORP_ID: CORP_ID,
      SSD_KEY: widget.docNo,
      WORK_DIV: WORK_DIV,
      PLATFORM: PLATFORM,
    );

    setState(() {
      _contentsModel = results;

      if (_contentsModel.isNotEmpty) {
        item = _contentsModel[0];
        if (item != null) {

          if (item?.SSD_MSG_GI2 == null || item?.SSD_MSG_GI2 == "") {
            item?.SSD_MSG_GI2 = '9';
          }

          if (item?.SSD_5BV_HM != null) {

            var hm = item!.SSD_5BV_HM ?? '';
            if(hm != '' && hm.length >= 4) {
              hm = '${hm.substring(0, 2)}:${hm.substring(2, 4)}';
            }

            txtSSD_5BV_HM.text = hm;
          }

          if (item?.SSD_SE != null) {
            txtSSD_SE.text = item!.SSD_SE ?? '';
          }


          if (item?.SSD_AGNT_MK != null) {

            var biz = item!.SSD_AGNT_MK ?? '';
            if(biz != '' && biz.length >= 10) {
              biz = '${biz.substring(0, 3)}-${biz.substring(3, 5)}-${biz.substring(5)}';
            }

            txtSSD_AGNT_MK.text = biz;
          }

          if (item?.SSD_AGNT_NM != null) {
            txtSSD_AGNT_NM.text = item!.SSD_AGNT_NM ?? '';
          }

          if (item?.SSD_ROLE_DIV == null || item?.SSD_ROLE_DIV == "") {
            item?.SSD_ROLE_DIV = '2';
            txtSSD_AGNT_MK.text = item!.SSD_DAE_MK ?? '';
            txtSSD_AGNT_NM.text = item!.SSD_DAE_NM ?? '';
          }



        }
      } else {
        Navigator.pop(context);
      }
    });
  }

  Future<void> showYesNoDialog(String ret) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("송신"),
          content: Text(ret),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // 아니오 선택
              child: const Text("예"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // 예 선택
              child: const Text("아니오"),
            ),
          ],
        );
      },
    );

    if (result == true) {
      var ret = await _sendCheckRepository.Send(
          widget.docNo, "5", "2");
      setState(() {
        if (ret == "OK") {

          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content:
                  const Text('송신되었습니다.',),
                  actions: [
                    TextButton(onPressed: ()=> Navigator.of(context).pop<bool>(true), child: const Text('확인',))
                  ],
                );
              }).then((value) {
            if(value) {
              Navigator.of(context).pop("OK");
            }
          });

        } else {
          showCustomAlertPopup(context, "", ret);
        }
      });
    }
  }
}
