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
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  TextEditingController addController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController mulController = TextEditingController();
  TextEditingController divController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: num1Controller,
                    decoration: InputDecoration(labelText: '첫번째 숫자를 입력하세여.'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(labelText: '두번째 숫자를 입력하세여.'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        child: Text('계산하기'),
                      ),
                      SizedBox(
                    width: 30,
                       ),
                  ElevatedButton(
                        onPressed: (){},
                        child: Text('지우기'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: addController,
                    decoration: InputDecoration(labelText: '덧셈 결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: subController,
                    decoration: InputDecoration(labelText: '뺄셈 결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mulController,
                    decoration: InputDecoration(labelText: '곱셈 결과'),
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: divController,
                    decoration: InputDecoration(labelText: '나눗셈 결과'),
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}