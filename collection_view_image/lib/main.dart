
import 'package:collection_view_image/detailList.dart';
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
  List<String> imageName = ['images/flower_01.png','images/flower_02.png','images/flower_03.png','images/flower_04.png','images/flower_05.png','images/flower_06.png'];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Main View'),
      ),
      child: GridView.builder(
        itemCount: imageName.length,
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
                    Image.asset(imageName[index],
                      fit: BoxFit.contain,
                      width: 80,
                      height: 100,
                    )
                  ],
                ),
                color: Colors.green[50],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailList(rcontentImage: imageName[index].toString());
                  }));
              },
            )
          );
        }
      ),
    );
  }

}