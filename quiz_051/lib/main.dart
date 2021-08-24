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
  String _lampImage = 'images/on.png';
  double _lampWidth = 150;
  double _lampHeigth = 300;
  bool _switch = true;
  bool _switchSize = false;


  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            children:[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeigth,
                    )
                  ],
                ),
                width: 350,
                height: 650,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('전구 확대',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      CupertinoSwitch(
                        value: _switchSize, 
                        onChanged: (value){
                          setState(() {
                            _switchSize = value;
                            decisionLampSize();
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('전구 스위치',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      CupertinoSwitch(
                        value: _switch, 
                        onChanged: (value){
                          setState(() {
                            _switch = value;
                            decisionOnOff();
                          });
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void decisionLampSize(){
    if (_switchSize){
      _lampWidth = 300;
      _lampHeigth = 600;
    }else{
      _lampWidth = 150;
      _lampHeigth = 300;
    }
  }

  void decisionOnOff(){
    if (_switch){
      _lampImage = "images/on.png";
    }else{
      _lampImage = "images/off.png";
    }
  }
}