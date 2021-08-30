import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({ Key? key }) : super(key: key);

  @override
  _InsertListState createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  List _imageName = ['images/bee.png', 'images/cat.png', 'images/dog.png'];
  int _selectedItem = 0;

  TextEditingController? _messageBox;

  @override
  void initState() {
    // TODO: implement initState
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset(_imageName[_selectedItem]),
                  ),
                  Container(
                    child: CupertinoPicker(
                      backgroundColor: Colors.white,
                      itemExtent: 60,
                      // 제일 먼저 시작하는 번지수
                      scrollController: FixedExtentScrollController(initialItem: 0),
                      onSelectedItemChanged: (value){
                        // 상태가 바꼈다!!
                        setState(() {
                          _selectedItem = value;
                        });
                      },
                      children: [
                        Image.asset(_imageName[0]),
                        Image.asset(_imageName[1]),
                        Image.asset(_imageName[2])
                      ],
                    ),
                    width: 200,
                    height: 250,
                  ),
                ],
              ),
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
        Message.insertData = _messageBox!.text.toString();
        Message.insertImagepath = _imageName[_selectedItem];
        Navigator.pop(context);
      }
    });
  }
}