import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_text_field.dart';


class Govcbr5jiContents extends StatefulWidget{

  const Govcbr5jiContents({super.key});

  @override
  State<Govcbr5jiContents> createState() => _Govcbr5jiContents();
}

class _Govcbr5jiContents extends State<Govcbr5jiContents>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('문서기능'),
                  SizedBox( height: 30, width: 30,),
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
                  SizedBox(width: 5,),
                  Text('[9:원본, 35:재전송]'),]),
                  SizedBox( height: 5),
                  Row (children: [
                    Text('문서구분'),
                    SizedBox( height: 30, width: 30,),
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
                    SizedBox(width: 5,),
                    Text('[1:완료보고, 2:이행확인]'),]),
                  SizedBox( height: 5),
                  Row (children: [
                    Text('보고일자'),
                    SizedBox( height: 30, width: 30,),
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
                  SizedBox( height: 5),
                  Row (children: [
                    Text('적재일시'),
                    SizedBox( height: 30, width: 30,),
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
                    SizedBox(width: 5,),
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
                    SizedBox( height: 30, width: 5,),
                    Text('(HHMM~4자리)'),
                  ]),
                  SizedBox( height: 5),
                  Row (children: [
                    Text('작업선명'),
                    SizedBox( height: 30, width: 30,),
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
                    Text('세관/정박항'),
                    SizedBox( height: 30, width: 10,),
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
                    SizedBox(width: 5,),
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
                    ElevatedButton(onPressed: () {  }, child: Text('조회'),),
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
                  Row (children: [
                    Text('선내장치장소'),
                    SizedBox( height: 30, width: 5,),
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
                  SizedBox( height: 5),
                  Row (children: [
                    Text('보고업체'),
                    SizedBox( height: 30, width: 20,),
                    SizedBox(
                      height: 35,
                      child: Radio<String>(value: '신고인', groupValue: '신고인', onChanged: (String? value) {  },),
                    ),
                    Text('신고인'),
                    SizedBox(
                      width: 50, // 원하는 너비 설정
                      height: 35,
                      child: Radio<String>(value: '대리인', groupValue: '', onChanged: (String? value) {  },),
                    ),
                    Text('대리인'),
                  ]),
                  Row (children: [
                    SizedBox( height: 30, width: 80,),
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
                    ElevatedButton(onPressed: () {  }, child: Text('조회'),),
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
                    SizedBox(width: 5,),
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
                  SizedBox( height: 5),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: () {  }, child: Text('저장'),),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {  }, child: Text('송신'),),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: () {  }, child: Text('목록'),),
                  ]),
                ],
              ),
            )
        ),
      ),
    );
  }

}