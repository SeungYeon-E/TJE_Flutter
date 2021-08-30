import 'package:collection_view_label/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertHero extends StatefulWidget {
  const InsertHero({ Key? key }) : super(key: key);

  @override
  _InsertHeroState createState() => _InsertHeroState();
}

class _InsertHeroState extends State<InsertHero> {
  TextEditingController? _messageBox;

  @override
  void initState() {
    super.initState();
    _messageBox = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'MainView',
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          middle: Text('Add View'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                child: CupertinoTextField(
                  controller: _messageBox,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                ),
                width: 300,
              ),
              CupertinoButton(
                child: Text('Add'),
                onPressed: (){
                  setState(() {
                    addList();
                  });
                },
              )
            ],
          ),
        ),
      )
    );
  }

  void addList(){
    setState(() {
      if (_messageBox!.text.isEmpty){
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text("제목을 입력해주세요!"),
        //       // 1초동안
        //       duration: Duration(seconds: 1),
        //       backgroundColor: Colors.red,
        //     ),
        //   );
      }else{
        Message.humanName = _messageBox!.text.toString();
        Navigator.pop(context);
      }
    });
  }
}