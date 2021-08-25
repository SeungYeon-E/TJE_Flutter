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
  double _lampWidth = 300;
  double _lampHeigth = 600;
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Alert',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Image.asset(
                  _lampImage,
                  width: _lampWidth,
                  height: _lampHeigth,
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('켜기'), 
                    // 모양이 딕셔너리 
                    onPressed: (){
                      _switch ? 
                      _showAlertCencel(title: "경고", message: "현재 On 상태입니다.") : _showAlert(title: "램프 켜기", message: "램프를 켜시겠습니까?");
                    }
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CupertinoButton(
                    child: Text('끄기'), 
                    // 모양이 딕셔너리 
                    onPressed: (){
                      !_switch ? 
                      _showAlertCencel(title: "경고", message: "현재 Off 상태입니다.") : _showAlert(title: "램프 끄기", message: "램프를 끄시겠습니까?");
                    }
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert({String? title, String? message}){
    showCupertinoDialog(
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: Text(title!),
          content: Text(message!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("네"),
              onPressed: (){
                setState(() {
                  _switch ? _switch = false : _switch = true;
                  !_switch ? _lampImage = 'images/off.png' : _lampImage = 'images/on.png';
                  // _lampImage = 'images/off.png';
                   Navigator.pop(context);
                });
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("아니오"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  void _showAlertCencel({String? title, String? message}){
    showCupertinoDialog(
      context: context, 
      builder: (context){
        return CupertinoAlertDialog(
          title: Text(title!),
          content: Text(message!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("네, 알겠습니다."),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      }
    );
  }

  void _showActionSheet({String? title, String? message}){
    showCupertinoModalPopup(
      context: context, 
      builder: (context){
        return CupertinoActionSheet(
          title: Text(title!),
          message: Text(message!),
          actions: [
            CupertinoActionSheetAction(
              isDefaultAction: true,
              child: Text("Action Default"),
              onPressed: (){
                print("Alert : Action Default");
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              child: Text("Action Destructive"),
              onPressed: (){
                print("Alert : Action Destructive");
                Navigator.pop(context);
              },
            ),
            
          ],
          cancelButton: CupertinoActionSheetAction(
              child: Text("Action Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                print("Alert : Action Cancel");
                Navigator.pop(context);
              },
            ),
        );
      }
    );
  }
}