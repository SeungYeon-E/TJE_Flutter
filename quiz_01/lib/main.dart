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
  late TextEditingController _controller;
  bool click = false;
  String name = 'Ham';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(!click ?
                  'Welcome!': "Welcome! $name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(onDoubleTap: (){setState(() {
                name = "hamster";
              });},
                child: CupertinoButton(child: Text('Name'), onPressed: (){
                   setState(() {
                     if (click){
                       click = false;
                     }else{
                       click = true;
                     }
                   });
                }
                          ),
              ),
          ],
        ),
      )
    );
  }
}