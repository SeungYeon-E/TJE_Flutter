import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_15/controller.dart';
import 'package:quiz_15/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? _messageBox;
  String _lampImage = 'images/on.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Main 화면',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Material(
          child: IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return Controller();
                })).then((value) => getData());
              },
              icon: Icon(Icons.edit)),
        ),
      ), // 화면쪽 디자인은 NavigationBar에서 끝남!
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _lampImage,
              width: 150,
              height: 300,
            )
          ],
        ),
      ),
    );
  }

  void getData() {
    if (Message.lampStatus) {
      setState(() {
        if (Message.contentsColor){
          _lampImage = 'images/on.png';
        }else{
          _lampImage = 'images/smile.png';
        }
      });
    } else {
      setState(() {
        _lampImage = 'images/off.png';
      });
    }
  }
} // <—