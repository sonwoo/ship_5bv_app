import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ship_5bv_app/util.dart';
import 'package:ship_5bv_app/screen/home_screen.dart';
import 'package:ship_5bv_app/globals.dart';

enum Type { edi, cs }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String _userType = 'EDI'; // 초기값으로 'EDI' 설정
  final TextEditingController _businessNumberController =
      TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _saveLoginInfo = false;

  final _targetUrl = '${API_URL}mobileUserAuth';

  AppUpdateInfo? _updateInfo;
  bool _isUpdateAvailable = false;
  String msg = '';

  @override
  void initState() {
    super.initState();
    _checkForUpdate();
    _loadSavedLoginInfo(); // 앱 실행 시 저장된 로그인 정보 불러오기
  }

  //업데이트 유무 알람
  Future<void> _checkForUpdate() async {
    try {
      AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();
      setState(() {
        _updateInfo = updateInfo;
        _isUpdateAvailable = updateInfo.updateAvailability ==
            UpdateAvailability.updateAvailable;
      });

      if (_isUpdateAvailable) {
        _showUpdateDialog();
      }
    } catch (e) {
      print('Failed to check for update: $e');
    }
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

    if (!isBusinessRegistrationNumber(businessNumber)) {
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
      'USERID': userId,
      'PASSWORD': password,
      'PLATFORM': _userType,
      'COMPANY_NO': businessNumber
    });

    Dio dio = Dio();
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    try {
      var response = await dio.post(
        _targetUrl,
        data: data,
      );

      if (response.statusMessage != 'OK') {
        showCustomAlertPopup(context, "알림", "서비스에 접속을 하지 못했습니다.");
      } else {
        String ret = response.data["Message"];
        if (ret.contains("인증이 성공하였습니다.")) {
          WORK_DIV = ret.split('/')[1];
          CORP_ID = ret.split('/')[2];
          PLATFORM = ret.split('/')[3];
          COMPANY_NO = businessNumber;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          showCustomAlertPopup(context, "로그인 실패", ret);
        }
      }
    } catch (ex) {
      showCustomAlertPopup(context, "알림", "서비스에 접속을 하지 못했습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/login_bg.jpg'),
            fit: BoxFit.fill, //
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                '선박용품 이행착수(완료)',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              const Text(
                '보고서 Application',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: _businessNumberController,
                  decoration: const InputDecoration(labelText: '사업자번호'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // 숫자만 입력 가능
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: _userIdController,
                  decoration: const InputDecoration(labelText: '아이디'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: '패스워드'),
                  obscureText: true,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              const SizedBox(height: 5),

              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.7, 50), // 버튼 높이 설정
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(53, 80, 161, 1.0), // 버튼 글자색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 모서리 둥글기를 조절
                  ),
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.red[200],
                    fontWeight: FontWeight.bold, // 글자 굵게
                  ),
                ),
                child: const Text('로그인'),
              ),
              const SizedBox(height: 10),
              Text(msg, style: TextStyle(
                fontSize: 18,
                color: Colors.red[500],
              ))
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '홈',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: '설정',
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        color: Colors.grey[300],
        height: 50,
        child: const Center(
          child: Text(
            '부산시 동구 중앙대로 240(초량동)현대해상빌딩 6층\nTel.051-966-7000 Fax.051-966-8000',
            style: TextStyle(
              fontSize: 13, // 글자 크기를 24로 설정
              fontWeight: FontWeight.bold, // 글자 굵게
            ),
          ),
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

  void _showUpdateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('업데이트가 가능합니다.'),
          content: const Text('새로운 버전으로 앱을 업데이트 할 수 있습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('나중에'),
            ),
            TextButton(
              onPressed: _startImmediateUpdate,
              child: const Text('업데이트'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _startImmediateUpdate() async {
    Navigator.of(context).pop(); // Close the dialog
    try {
      await InAppUpdate.performImmediateUpdate();
    } catch (e) {
      msg = '$e \r\n자동 업데이트에 문제가 있습니다. Play 스토어에서 업데이트 하시기 바랍니다.';
    }
  }


}
