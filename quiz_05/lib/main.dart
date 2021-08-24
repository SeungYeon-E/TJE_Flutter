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

  TextEditingController? _multilines;
  TextEditingController? _singleline;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _multilines = TextEditingController();
    _singleline = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("구구단 출력",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CupertinoTextField(
                      controller: _singleline,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      placeholder: '구구단',
                    ),
                    width: 80,
                  ),
                  CupertinoButton(
                    child: Text('단 출력'), 
                    onPressed: (){
                      setState(() {
                        insertLines();
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 20, 80, 0),
                child: CupertinoTextField(
                  controller: _multilines,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(color: Colors.amber[100]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void insertLines(){
    _multilines!.clear();

    if (_singleline!.text == ''){
      // showSnackBar(context);
    }else{
      for (int i = 1; i < 10; i++){
        int j = int.parse(_singleline!.text);
        _multilines!.text += "$j X $i = ${j * i}\n";
      }
    }
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("정보를 입력해주세요!"),
      backgroundColor: Colors.teal,
      )
    );
  }

}
