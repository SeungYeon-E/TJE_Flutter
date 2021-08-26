import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_15/message.dart';

class Controller extends StatefulWidget {
  const Controller({ Key? key }) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  TextEditingController? _messageBox;
  bool _switch = true;
  String switchText = 'On';
  bool _switchColor = true;
  String switchTextColor = 'Yellow';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();

    if(Message.lampStatus){
      setState(() {
        _switch = true;
        switchText = 'On';
        if(Message.contentsColor){
          _switchColor = true;
          switchTextColor = 'Yellow';
        }else{
          _switchColor = false;
          switchTextColor = 'Red';
        }
      });
    }else{
      setState(() {
        _switch = false;
        switchText = 'Off';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'Main 화면',
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          middle: Text('수정화면'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(switchTextColor, ),
                    SizedBox(width: 10,),
                    CupertinoSwitch(
                      value: _switchColor, 
                      onChanged: (value){
                        setState(() {
                          _switchColor = value;
                          decisionOnOff();
                        });
                      }
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(switchText, ),
                    SizedBox(width: 10,),
                    CupertinoSwitch(
                      value: _switch, 
                      onChanged: (value){
                        setState(() {
                          _switch = value;
                          decisionOnOff();
                        });
                      }
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  void decisionOnOff(){
    setState(() {
      if(_switch){
        Message.lampStatus = true;
        switchText = "On";
        
      }else{
        Message.lampStatus = false;
        switchText = "Off";
      }

      if(_switchColor){
          Message.contentsColor = true;
          switchTextColor = 'Yellow';
        }else{
          Message.contentsColor = false;
          switchTextColor = 'Red';
        }
    });
  }
}