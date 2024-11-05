import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _saveLoginInfo = false;

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
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _saveLoginInfo = prefs.getBool('saveLoginInfo') ?? false;
    });
  }

  // 로그인 버튼을 클릭했을 때 실행되는 메서드
  Future<void> _login() async {

    String businessNumber = _businessNumberController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (businessNumber.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 항목을 입력해주세요.')),
      );
      return;
    }

    if (_saveLoginInfo) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userType', _userType);
      await prefs.setString('businessNumber', businessNumber);
      await prefs.setString('username', username);
      await prefs.setString('password', password);
      await prefs.setBool('saveLoginInfo', _saveLoginInfo);
    }

    //여기에 로그인 인증 서비스를 호출
    //로그인 잘 되었다 치고..

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('사용구분'),
            Row(
              children: [
                Radio<String>(
                  value: 'EDI',
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                ),
                Text('조건부 신고'),
                Radio<String>(
                  value: 'CS',
                  groupValue: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                ),
                Text('EDI 선용품'),
              ],
            ),
            TextField(
              controller: _businessNumberController,
              decoration: InputDecoration(labelText: '사업자번호'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // 숫자만 입력 가능
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '아이디'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '패스워드'),
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
                Text('로그인 정보 저장'),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }



}