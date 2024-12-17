import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ship_5bv_app/screen/auth_screen.dart';

void main() {

  runApp(
     const MaterialApp(
      debugShowCheckedModeBanner: false,
      //기본 위젯 한글
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: AuthScreen(),
    )
  );
}
