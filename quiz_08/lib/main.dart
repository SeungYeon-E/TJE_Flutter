import 'dart:async';
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
  List<String> _images = ['flower_01.png', 'flower_02.png','flower_03.png','flower_04.png','flower_05.png','flower_06.png'];
  double _lampWidth = 300;
  double _lampHeigth = 600;
  bool _isRunning = true;
  int num = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (!_isRunning) {
        timer.cancel();
      }
      decisionLampSize();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("3초마다 이미지 무한 변경 무한 반복",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(_images[num].toString(),
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'images/${_images[num]}',
                      width: _lampWidth,
                      height: _lampHeigth,
                    )
                  ],
                ),
                width: 350,
                height: 700,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void decisionLampSize(){
    setState(() {
      num += 1;
      if (num > _images.length-1){
        num = 0;
      }
    });
  }
}