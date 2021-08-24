import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  TextEditingController? _num1Controller;
  TextEditingController? _num2Controller;
  TextEditingController? _addController;
  TextEditingController? _subController;
  TextEditingController? _mulController;
  TextEditingController? _divController;

  int num1 = 0;
  int num2 = 0;

  @override
  void initState() {
    super.initState();
    _num1Controller = TextEditingController();
    _num2Controller = TextEditingController();
    _addController = TextEditingController();
    _subController = TextEditingController();
    _mulController = TextEditingController();
    _divController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: CupertinoApp(
        home: CupertinoPageScaffold(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      '두개의 숫자연산',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('첫번째 숫자 : '),
                            width: 90,
                          ),
                          // 이게 뭐랑 비슷하다구..?
                          Container(
                            child: CupertinoTextField(
                              controller: _num1Controller,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              placeholder: '숫자를 입력하세요!',
                              textAlign: TextAlign.right,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('두번째 숫자 : '),
                            width: 90,
                          ),
                          // 이게 뭐랑 비슷하다구..?
                          Container(
                            child: CupertinoTextField(
                              controller: _num2Controller,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              placeholder: '숫자를 입력하세요!',
                              textAlign: TextAlign.right,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  CupertinoButton(child: Text('계산하기'), onPressed: (){
                    _calculate();
                
                  }),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('덧셈결과 : '),
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _addController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              readOnly: true,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('뺄셈 결과 : '),
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _subController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              readOnly: true,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('곱셈 결과 : '),
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _mulController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              readOnly: true,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                          Container(
                            child: Text('나눗셈 결과 : '),
                            width: 90,
                          ),
                          Container(
                            child: CupertinoTextField(
                              controller: _divController,
                              keyboardType: TextInputType.text,
                              maxLines: 1,
                              readOnly: true,
                            ),
                            width: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      '환영합니다!',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _calculate(){
    if (_num1Controller!.text == "" || _num1Controller!.text.isEmpty || _num2Controller!.text == "" || _num2Controller!.text.isEmpty) {
      showSnackBar(context);
    }else {
      setState(() {
        num1 = int.parse(_num1Controller!.text);
        num2 = int.parse(_num2Controller!.text);
        _addController!.text = "${num1 + num2}";
        _subController!.text = "${num1 - num2}";
        _mulController!.text = "${num1 * num2}";
        if ((num1 == 0 && num2 == 0) || (num1 != 0 && num2 == 0)) {
          _divController!.text = "나눗셈 불가능";
        }else {
          _divController!.text = "${num1 / num2}";
        }
      });
    }
    
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
