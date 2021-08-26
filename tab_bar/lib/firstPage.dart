import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _lampImage = 'images/on.png';
  double _lampWidth = 150;
  double _lampHeigth = 300;
  String _buttonName = "Image 확대";
  String _lampSizeStatus = "small";
  bool _switch = true;


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
                  CupertinoButton(
                    child: Text(_buttonName), 
                    onPressed: (){
                      setState(() {
                        decisionLampSize();
                      });
                    },
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
    if(_lampSizeStatus == 'small'){
      _lampSizeStatus = "large";
      _lampWidth = 300;
      _lampHeigth = 600;
      _buttonName = "Image 축소";
    }else{
      _lampSizeStatus = "small";
      _lampWidth = 150;
      _lampHeigth = 300;
      _buttonName = "Image 확대";
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