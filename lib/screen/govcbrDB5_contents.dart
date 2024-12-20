import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_popup_buttons.dart';
import 'package:ship_5bv_app/component/custom_text_field.dart';
import 'package:ship_5bv_app/const/colors.dart';
import 'package:ship_5bv_app/model/govcbrDB5_contents_model.dart';
import 'package:ship_5bv_app/repository/govcbrDB5_repository.dart';
import 'package:ship_5bv_app/repository/send_check_repository.dart';
import 'package:ship_5bv_app/screen/stmst_screen.dart';
import 'package:ship_5bv_app/screen/anchorage_screen.dart';
import 'package:ship_5bv_app/globals.dart';
import 'package:intl/intl.dart';
import 'package:ship_5bv_app/util.dart';
import 'package:ship_5bv_app/screen/freight_list.dart';

class Govcbrdb5Contents extends StatefulWidget {
  final String docNo;

  const Govcbrdb5Contents({super.key, required this.docNo});

  @override
  State<Govcbrdb5Contents> createState() => _Govcbrdb5Contents();
}

class _Govcbrdb5Contents extends State<Govcbrdb5Contents> {
  final Govcbrdb5Repository _govcbrdb5Repository = Govcbrdb5Repository();
  final SendCheckRepository _sendCheckRepository = SendCheckRepository();

  List<Govcbrdb5ContentsModel> _contentsModel = [];
  Govcbrdb5ContentsModel? item;
  String initDate =
      '${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';


  final TextEditingController txtSSD_DB7_HM = TextEditingController();


  final TextEditingController txtSSD_JUNGBAK_COD = TextEditingController();
  final TextEditingController txtSSD_SE = TextEditingController();
  final TextEditingController txtTMPPORT_CD = TextEditingController();

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

    txtSSD_DB7_HM.dispose();


    txtSSD_SE.dispose();
    txtTMPPORT_CD.dispose();
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
              '하선 ${widget.docNo} ',
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                          ]),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                            Row(children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: 25,
                                child: const Text('문서구분',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: LABEL_COLOR,
                                  ),),
                              ),
                              SizedBox(
                                height: 35,
                                child: Radio<String>(
                                  value: '1',
                                  groupValue: item!.SSD_F_GBN,
                                  onChanged: (val) {
                                    setState(() {
                                      item?.SSD_F_GBN = '1';
                                    });
                                  },
                                ),
                              ),
                              const Text('1:이행확인'),
                              SizedBox(
                                width: 50, // 원하는 너비 설정
                                height: 35,
                                child: Radio<String>(
                                  value: '2',
                                  groupValue: item!.SSD_F_GBN,
                                  onChanged: (val) {
                                    setState(() {
                                      item?.SSD_F_GBN = '2';
                                    });
                                  },
                                ),
                              ),
                              const Text('2:완료보고'),
                              ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                              child: const Text('보고일자',
                                style: const TextStyle(
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
                                ))
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                              child: const Text('하선일시',
                                style: const TextStyle(
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
                                        item?.SSD_DB7_DAY =
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
                                  child: Text(item?.SSD_DB7_DAY ?? initDate),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 80, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_DB7_HM,
                                isTime: true,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_DB7_HM = val;
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
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                              child: const Text('세관정박항',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: LABEL_COLOR,
                                ),),
                            ),
                            SizedBox(
                              width: 70, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_SE,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_SE = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 120, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_JUNGBAK_COD,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_JUNGBAK_COD = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 70, // 원하는 너비 설정
                              height: 35,
                              child: CustomPopupButtons(
                                title: "정박항",
                                type: Anchorage(custom: txtSSD_SE.text),
                                name: "조회",
                                onSelected: (result) {
                                  setState(() {
                                    txtSSD_SE.text = result['SSD_SE'] ?? "";
                                    txtSSD_JUNGBAK_COD.text =
                                        result['SSD_JUNGBAK_COD'] ?? "";
                                    txtTMPPORT_CD.text =
                                        result['TMPPORT_CD'] ?? "";
                                  });
                                },
                              ),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                            ),
                            SizedBox(
                              width: 200, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtTMPPORT_CD,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.TMPPORT_CD = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: 25,
                              child: const Text('보고업체',
                                style: const TextStyle(
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
                                    txtSSD_AGNT_CD.text = item!.SSD_SIN_CD.toString();
                                    txtSSD_AGNT_MK.text = item!.SSD_SIN_MK.toString();
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
                                    txtSSD_AGNT_CD.text = item!.SSD_DAE_CD.toString();
                                    txtSSD_AGNT_MK.text = item!.SSD_DAE_MK.toString();
                                    txtSSD_AGNT_NM.text = item!.SSD_DAE_NM.toString();
                                  });
                                },
                              ),
                            ),
                            const Text('신고대리인')
                            ] ),
                            Row(children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: 25,
                              ),
                            SizedBox(
                              width: 70, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_AGNT_CD,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_AGNT_CD = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 120, // 원하는 너비 설정
                              height: 35,
                              child: CustomTextField(
                                controller: txtSSD_AGNT_MK,
                                isTime: false,
                                onSaved: (val) {
                                  setState(() {
                                    item?.SSD_AGNT_MK = val;
                                  });
                                },
                                validator: (String? val) {
                                  return null;
                                },
                              ),
                            ),
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
                                    txtSSD_AGNT_CD.text =
                                        result['SSD_AGNT_CD'] ?? "";
                                    txtSSD_AGNT_MK.text =
                                        result['SSD_AGNT_MK'] ?? "";
                                    txtSSD_AGNT_NM.text =
                                        result['SSD_AGNT_NM'] ?? "";
                                  });
                                },
                              ),
                            ),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 25,
                            ),
                            SizedBox(
                              width: 200, // 원하는 너비 설정
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
                                      docdiv: "GOVCBRDB5FreightList",
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
                                      var ret = await _govcbrdb5Repository
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
                                          fontWeight: FontWeight.bold, // 굵기
                                          fontSize: 15, // 글자 크기
                                        ),
                                      ),
                                    ),
                                    child: const Text('저   장'),
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
                                      var ret = await _govcbrdb5Repository
                                          .updateConents(widget.docNo, item!);

                                      if (ret.toString() == "OK") {
                                        ret = await _sendCheckRepository
                                            .checkDoEnd(
                                                widget.docNo, "3", true);

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
                                          fontWeight: FontWeight.bold, // 굵기
                                          fontSize: 15, // 글자 크기
                                        ),
                                      ),
                                    ),
                                    child: const Text('송   신'),
                                  ),
                                ),
                              ]),
                          // Expanded(
                          //     child: FreightList(
                          //   docno: widget.docNo,
                          //   docdiv: "GOVCBRDB5FreightList",
                          // ))
                        ],
                      ),
                    ),
                  )
                  ),
              ),
            ),
    ),
    );
  }

  void _getContents() async {
    final results = await _govcbrdb5Repository.getContents(
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


          if (item?.SSD_DB7_HM != null) {
            txtSSD_DB7_HM.text = item!.SSD_DB7_HM ?? '';
          }


          if (item?.SSD_SE != null) {
            txtSSD_SE.text = item!.SSD_SE ?? '';
          }

          if (item?.SSD_JUNGBAK_COD != null) {
            txtSSD_JUNGBAK_COD.text = item!.SSD_JUNGBAK_COD ?? '';
          }

          if (item?.TMPPORT_CD != null) {
            txtTMPPORT_CD.text = item!.TMPPORT_CD ?? '';
          }

          if (item?.SSD_AGNT_CD != null) {
            txtSSD_AGNT_CD.text = item!.SSD_AGNT_CD ?? '';
          }

          if (item?.SSD_AGNT_MK != null) {
            txtSSD_AGNT_MK.text = item!.SSD_AGNT_MK ?? '';
          }

          if (item?.SSD_AGNT_NM != null) {
            txtSSD_AGNT_NM.text = item!.SSD_AGNT_NM ?? '';
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
          widget.docNo, "3", item?.SSD_F_GBN ?? "1");
      setState(() {
        if (ret == "OK") {
          showCustomAlertPopup(context, "", "송신하였습니다.");
        } else {
          showCustomAlertPopup(context, "", ret);
        }
      });
    }
  }
}
