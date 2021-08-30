import 'package:collection_view_label/detailHero.dart';
import 'package:collection_view_label/insertHero.dart';
import 'package:collection_view_label/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
  late List<String> heroList = [];

  @override
  void initState() {
    super.initState();
    heroList.add('유비');
    heroList.add('관우');
    heroList.add('장비');
    heroList.add('조조');
    heroList.add('여포');
    heroList.add('초선');
    heroList.add('손견');
    heroList.add('장양');
    heroList.add('손책');
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('삼국지 인물'),
        trailing: Material(
          child: IconButton(
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context){
                return InsertHero();
              })).then((value) => rebuildData());
              // => 이모양이 (){} 이모양이야
            },
            icon: Icon(Icons.add)
          ),
        ),
      ),
      child: GridView.builder(
        itemCount: heroList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 갯수
          crossAxisCount: 3,
          // 간격
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ), 
        itemBuilder: (context, index){
          return Container(
            height: 50,
            color: Colors.grey,
            child: GestureDetector(
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(heroList[index])
                  ],
                ),
                color: Colors.yellow,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailHero(rcontentList: heroList[index].toString());
                  }));
              },
            )
          );
        }
      ),
    );
  }
  void rebuildData(){
    setState(() {
      heroList.add(Message.humanName);
    });
  }
}