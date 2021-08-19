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
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // textfield 마다 controller 필요! (tf 여러 개면 controller도 여러 개 생성해야 함!)
  TextEditingController textController = TextEditingController();
  // snackbar 함수에 보낼 변수
  late String inputValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // 키보드 화면 어디에 누르든 내리게 하기 위함
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single Textfield'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  // 데이터 주고받기에 controller가 필요함!
                  controller: textController,
                  decoration: InputDecoration(
                    // hint
                    labelText: '글자를 입력하세요!',
                  ),
                  // TextInputType.number : 숫자 키보드
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: (){
                    // tf 에 데이터 있는지 check
                    if (textController.text == "" || textController.text.isEmpty) {
                      errorSnackBar(context);
                    }else{
                      inputValue = textController.text;
                      showSnackBar(context, inputValue);
                    }
                  }, 
                  child: Text("출력"),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("글자를 입력해주세요!"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
      ),
  );
}

void showSnackBar(BuildContext context, String inputValue) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("입력하신 글자는 $inputValue 입니다!"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.teal,
      ),
  );
}