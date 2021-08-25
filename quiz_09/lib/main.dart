import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
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
  List _danName = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  int _selectedItem = 0;
  TextEditingController? _multilines;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _multilines = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${_danName[_selectedItem]}단",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 30,
                  // 제일 먼저 시작하는 번지수
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value){
                    // 상태가 바꼈다!!
                    setState(() {
                      _selectedItem = value;
                      insertLines();
                    });
                  },
                  children: [
                    Text('${_danName[0]}단'),
                    Text('${_danName[1]}단'),
                    Text('${_danName[2]}단'),
                    Text('${_danName[3]}단'),
                    Text('${_danName[4]}단'),
                    Text('${_danName[5]}단'),
                    Text('${_danName[6]}단'),
                    Text('${_danName[7]}단'),
                    Text('${_danName[8]}단'),
                  ],
                ),
                width: 300,
                height: 250,
              ),
              Container(
                child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CupertinoTextField(
                  controller: _multilines,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(color: Colors.amber[100]),
                ),
               ),
               width: 250,
               height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
  void insertLines(){
    _multilines!.clear();
    for (int i = 1; i < 10; i++){
      int j = int.parse(_danName[_selectedItem]);
      _multilines!.text += "$j X $i = ${j * i}\n";
    }
  }
}