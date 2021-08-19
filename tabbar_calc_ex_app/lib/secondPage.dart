import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  // TextEditingController addController = TextEditingController();
  
  int num1 = 0;
  int num2 = 0;
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("간단한 계산기"),
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    ),
                ),
                  TextField(
                    controller: num1Controller,
                    // decoration: InputDecoration(
                    //   labelText: "첫 번째 숫자를 입력하세요!"
                    // ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: num2Controller,
                    // decoration: InputDecoration(
                    //   labelText: "두 번째 숫자를 입력하세요!"
                    // ),
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
                          setState(() {
                            resultText = "";   
                          });
                        }else {
                          
                          setState(() {
                            num1 = int.parse(num1Controller.text);
                            num2 = int.parse(num2Controller.text);
                            resultText = "덧셈 결과 : ${num1 + num2}";   
                          });
                        }
                      }, child: Row(
                        children: [
                          Icon(Icons.add),
                          Text("덧셈 계산"),
                        ],
                      )
                      ,),
                      SizedBox(
                        width: 20,
                     ),
                     
                    ],
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