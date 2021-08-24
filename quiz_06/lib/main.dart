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
  List _images = ['flower_01.png', 'flower_02.png','flower_03.png','flower_04.png','flower_05.png','flower_06.png'];
  double _lampWidth = 300;
  double _lampHeigth = 600;
  String _prev = "이전";
  String _next = "다음";
  bool _switch = true;
  int num = 0;

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
                    Text(_images[0].toString(),
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      'images/${_images[0]}',
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
                  CupertinoButton(
                    child: Text(_prev), 
                    onPressed: (){
                      setState(() {
                        _switch = false;
                        decisionLampSize(_switch);
                      });
                    },
                  ),
                  CupertinoButton(
                    child: Text(_next), 
                    onPressed: (){
                      setState(() {
                        _switch = true;
                        decisionLampSize(_switch);
                      });
                    },
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void decisionLampSize(bool result){
    if(_switch){
      num -= 1;
      if (num < 0){
        num = _images.length-1;
      }
      _lampWidth = 300;
      _lampHeigth = 600;
      _buttonName = "Image 축소";
    }else{
      num += 1;
      _lampSizeStatus = "small";
      _lampWidth = 150;
      _lampHeigth = 300;
      _buttonName = "Image 확대";
    }
  }

  // void decisionOnOff(){
  //   if (_switch){
  //     _lampImage = "images/on.png";
  //   }else{
  //     _lampImage = "images/off.png";
  //   }
  // }
}