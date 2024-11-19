import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_text_field.dart';
import 'package:ship_5bv_app/component/custom_popup_buttons.dart';
import 'package:ship_5bv_app/screen/stmst_screen.dart';
import 'package:ship_5bv_app/screen/anchorage_screen.dart';


class Govcbrdb5Contents extends StatefulWidget{

  final String docNo;

  const Govcbrdb5Contents({super.key, required this.docNo});

  @override
  State<Govcbrdb5Contents> createState() => _Govcbrdb5Contents();
}

class _Govcbrdb5Contents extends State<Govcbrdb5Contents>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8,bottom: 8),
              child: Column(
                children: [
                  Row (children: [
                  const Text('문서기능'),
                  const SizedBox( height: 30, width: 30,),
                  SizedBox(
                    width: 50, // 원하는 너비 설정
                    height: 35,
                    child: CustomTextField(
                      isTime: false,
                      onSaved: (String? val){
                        //startTime = int.parse(val!);
                      },
                      validator:  (String? val){
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5,),
                  const Text('[9:원본, 35:재전송]'),]),
                  const SizedBox( height: 5),
                  Row (children: [
                    const Text('문서구분'),
                    const SizedBox( height: 30, width: 30,),
                    SizedBox(
                      width: 50, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text('[1:완료보고, 2:이행확인]'),]),
                  const SizedBox( height: 5),
                  Row (children: [
                    const Text('보고일자'),
                    const SizedBox( height: 30, width: 30,),
                    SizedBox(
                      width: 100, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                   ]),
                  const SizedBox( height: 5),
                  Row (children: [
                    const Text('하선일시'),
                    const SizedBox( height: 30, width: 30,),
                    SizedBox(
                      width: 100, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 80, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const SizedBox( height: 30, width: 5,),
                    const Text('(HHMM)'),
                  ]),
                  const SizedBox( height: 5),
                  Row (children: [
                    const Text('작업선명'),
                    const SizedBox( height: 30, width: 30,),
                    SizedBox(
                      width: 200, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                  ]),
                  Row (children: [
                    const Text('세관/정박항'),
                    const SizedBox( height: 30, width: 10,),
                    SizedBox(
                      width: 50, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    SizedBox(
                      width: 80, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const CustomPopupButtons(title: "정박항", type: Anchorage() , name: "조회"),
                  ]),
                  Row (children: [
                    const SizedBox( height: 30, width: 80,),
                    SizedBox(
                      width: 200, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                  ]),
                  const SizedBox( height: 5),
                  Row (children: [
                    const Text('보고업체'),
                    const SizedBox( height: 30, width: 20,),
                    SizedBox(
                      height: 35,
                      child: Radio<String>(value: '신고인', groupValue: '신고인', onChanged: (String? value) {  },),
                    ),
                    const Text('신고인'),
                    SizedBox(
                      width: 50, // 원하는 너비 설정
                      height: 35,
                      child: Radio<String>(value: '대리인', groupValue: '', onChanged: (String? value) {  },),
                    ),
                    const Text('대리인'),
                  ]),
                  Row (children: [
                    const SizedBox( height: 30, width: 80,),
                    SizedBox(
                      width: 50, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const CustomPopupButtons(title: "거래처", type: StmstScreen() , name: "조회"),
                    SizedBox(
                      width: 80, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                  ]),
                  Row (children: [
                    const SizedBox( height: 30, width: 80,),
                    SizedBox(
                      width: 200, // 원하는 너비 설정
                      height: 35,
                      child: CustomTextField(
                        isTime: false,
                        onSaved: (String? val){
                          //startTime = int.parse(val!);
                        },
                        validator:  (String? val){
                          return null;
                        },
                      ),
                    ),
                  ]),
                  const SizedBox( height: 5),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: () {  }, child: const Text('저장'),),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {  }, child: const Text('송신'),),
                    const SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {  }, child: const Text('목록'),),
                  ]),
                ],
              ),
            )
        ),
      ),
    );
  }

}