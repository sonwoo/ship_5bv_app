import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ship_5bv_app/screen/auth_screen.dart';
import 'package:ship_5bv_app/screen/home_screen.dart';

void main() {
  runApp(
    //시작 테스트3
    //시작 테스트1
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomeScreen(),
    )
  );
}
