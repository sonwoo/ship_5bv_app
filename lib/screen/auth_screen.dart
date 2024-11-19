import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ship_5bv_app/globals.dart';
import 'package:ship_5bv_app/util.dart';
import 'package:ship_5bv_app/screen/home_screen.dart';

enum Type {edi,cs}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{

  String _userType = 'EDI'; // 초기값으로 'EDI' 설정
  final TextEditingController _businessNumberController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _saveLoginInfo = false;

  final _targetUrl = "http://192.168.200.38:3000/api/mobileUserAuth";

  @override
  void initState()
  {
    super.initState();
    _loadSavedLoginInfo(); // 앱 실행 시 저장된 로그인 정보 불러오기
  }

  // SharedPreferences에 저장된 데이터를 로드하는 메서드
  Future<void> _loadSavedLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userType = prefs.getString('userType') ?? 'EDI';
      _businessNumberController.text = prefs.getString('businessNumber') ?? '';
      _userIdController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _saveLoginInfo = prefs.getBool('saveLoginInfo') ?? false;
    });
  }

  // 로그인 버튼을 클릭했을 때 실행되는 메서드
  Future<void> _login() async {

    String businessNumber = _businessNumberController.text.trim();
    String userId = _userIdController.text.trim();
    String password = _passwordController.text.trim();

    if (businessNumber.isEmpty || userId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 항목을 입력해주세요.')),
      );
      return;
    }

    if(!isBusinessRegistrationNumber(businessNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('사업자번호 형식이 맞지 않습니다.')),
      );
      return;
    }

    if (_saveLoginInfo) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userType', _userType);
      await prefs.setString('businessNumber', businessNumber);
      await prefs.setString('username', userId);
      await prefs.setString('password', password);
      await prefs.setBool('saveLoginInfo', _saveLoginInfo);
    }

    final data = jsonEncode({
      'USERID' : userId,
      'PASSWORD' : password,
      'PLATFORM' : _userType,
      'COMPANY_NO':businessNumber
    });

    Dio dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {

      var response = await dio.post(_targetUrl, data: data, );

      if(response.statusMessage != 'OK') {
        showCustomAlertPopup(context, "알림", "서비스에 접속을 하지 못했습니다.");
      } else
      {
        String ret =  response.data["Message"];
        if(ret.contains("인증이 성공하였습니다.")){

          CORP_ID = ret.split('/')[2];
          PLATFORM = _userType;
          COMPANY_NO = businessNumber;
          WORK_DIV = ret.split('/')[1];

          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomeScreen()));

          }
          else {
          showCustomAlertPopup(context, "로그인 실패", ret);
        }
      }
    }
    catch(ex){
      showCustomAlertPopup(context, "알림", "서비스에 접속을 하지 못했습니다.");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('선용품 이행완료보고'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Row(
              children: [
                const Text('사용구분'),
                Radio<String>(
                  value: 'EDI',
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                ),
                const Text('조건부 신고'),
                Radio<String>(
                  value: 'CS',
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                ),
                const Text('EDI 선용품'),
              ],
            ),
            TextField(
              controller: _businessNumberController,
              decoration: const InputDecoration(labelText: '사업자번호'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 숫자만 입력 가능
            ),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(labelText: '아이디'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: '패스워드'),
              obscureText: true,
            ),
            Row(
              children: [
                Checkbox(
                  value: _saveLoginInfo,
                  onChanged: (value) {
                    setState(() {
                      _saveLoginInfo = value!;
                    });
                  },
                ),
                const Text('로그인 정보 저장'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }

  static bool isBusinessRegistrationNumber(String value) {
    RegExp regExp = RegExp(
      r'^\d{3}\d{2}\d{5}$',
      caseSensitive: false,
      multiLine: false,
    );

    return regExp.hasMatch(value);
  }

}