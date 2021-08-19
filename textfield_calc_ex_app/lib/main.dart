import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  int num1 = 0;
  int num2 = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("간단한 계산기"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: num1Controller,
                    decoration: InputDecoration(
                      labelText: "첫 번째 숫자를 입력하세요!"
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: num2Controller,
                    decoration: InputDecoration(
                      labelText: "두 번째 숫자를 입력하세요!"
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        if (num1Controller.text == "" || num1Controller.text.isEmpty || num2Controller.text == "" || num2Controller.text.isEmpty) {

                          showSnackBar(context);
                        }else {
                          
                          setState(() {
                            num1 = int.parse(num1Controller.text);
                            num2 = int.parse(num2Controller.text);
                            addController.text = "${num1 + num2}";
                            subController.text = "${num1 - num2}";
                            mulController.text = "${num1 * num2}";
                            if ((num1 == 0 && num2 == 0) || (num1 != 0 && num2 == 0)) {
                              divController.text = "나눗셈 불가능";
                            }else {
                              divController.text = "${num1 / num2}";
                            }
                          });
                        }
                      }, child: Text("계산하기")
                      ,),
                      SizedBox(
                        width: 20,
                     ),
                     ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                       ),
                       onPressed: (){
                         num1Controller.text = "";
                         num2Controller.text = "";
                         addController.text = "";
                         subController.text = "";
                         mulController.text = "";
                         divController.text = "";
                      }, child: Text("지우기")
                      ,),
                    ],
                    ),
                  SizedBox(
                  height: 10,
                  ),
                  TextField(
                    controller: addController,
                    decoration: InputDecoration(
                      labelText: "덧셈 결과"
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                  height: 10,
                  ),
                  TextField(
                    controller: subController,
                    decoration: InputDecoration(
                      labelText: "뺄셈 결과"
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                  height: 10,
                  ),
                  TextField(
                    controller: mulController,
                    decoration: InputDecoration(
                      labelText: "곱셈 결과"
                    ),
                    readOnly: true,
                  ),
                  SizedBox(
                  height: 10,
                  ),
                  TextField(
                    controller: divController,
                    decoration: InputDecoration(
                      labelText: "나눗셈 결과"
                    ),
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

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text("숫자를 입력해주세요!"),
    backgroundColor: Colors.teal,
    )
  );
}