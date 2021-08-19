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

/*
함수를 만들 때는 (BuildContext context) 로 해야 함!
context : Widget에 대한 meta 정보나 widget tree의 위치를 나타냄.
*/

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog with Gesture"),
      ),
      body: Center(
        child: GestureDetector( // 눌렀을 때 동작을 주기 위해 생성
          onTap: () {
            // _ 로 시작하는 게 private method! (없으면 public)
            _showDialog(context); // 위치를 알려줘야 하기에 context 지정
          },
          child: Text("Hello World!"),
          ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context, 
    // builder : alertDialog를 만드는 것!
    builder: (BuildContext context){
      // 위에 build 함수와 동일하게 만들어주면 됨!
      return AlertDialog(
        title: Text("Alert Title"),
        content: Text('Hello World를 Touch 했습니다!'),
        actions: [
          // alert에 버튼 사용하고 싶은 경우 actions 사용해서 만들어주기
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: (){
              // alert 화면을 없애버리는 것!
              Navigator.of(context).pop();
            }, 
            child: Text("종료"),
            ),
        ],
      );
    },
  );
}