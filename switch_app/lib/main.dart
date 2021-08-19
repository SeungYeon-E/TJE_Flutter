import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const : 생성자
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// private class
class _MyHomePageState extends State<MyHomePage> {

  // 전역 변수 선언
  // switchValue 의 데이터 타입 모르기에 var로 선언
  // 사용할 변수 override 위에 전역변수로 해주기
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Switch"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: switchValue, 
              // 변했을 때 어떻게 할 것인지 정의
              // change 함수는 parameter 값 줘야 함!
              onChanged: (value){
                setState(() {
                  // switch 값이 바뀌었다는 것을 정의해줘야함!
                  switchValue = value;
                  print(switchValue);                  
                });
              }
            ),
          ],
        ),
      ),
    );
  }
}
