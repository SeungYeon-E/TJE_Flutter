
import 'package:drawer_ex_app/Screen.dart';
import 'package:drawer_ex_app/screenReceive.dart';
import 'package:drawer_ex_app/screenSend.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context){
          return Screen();
        },
        '/sendMail': (context){
          return ScreenSend();
        },
        '/receivedMail': (context){
          return ScreenReceive();
        },
      },
    );
  }
}
