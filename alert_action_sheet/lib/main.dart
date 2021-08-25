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
                  'Alert와 Action Sheet',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('Alert'), 
                    // 모양이 딕셔너리 
                    onPressed: (){
                      _showAlert(title: "Title", message: "Message");
                    }
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CupertinoButton(
                    child: Text('Action Sheet'), 
                    // 모양이 딕셔너리 
                    onPressed: (){
                      _showActionSheet(title: "Title", message: "Message");
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
              child: Text("Action Default"),
              onPressed: (){
                print("Alert : Action Default");
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text("Action Destructive"),
              onPressed: (){
                print("Alert : Action Destructive");
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
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