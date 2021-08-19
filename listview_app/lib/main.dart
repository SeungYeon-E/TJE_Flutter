import 'package:flutter/material.dart';
import 'package:listview_app/firstPage.dart';
import 'package:listview_app/secondPage.dart';
import 'package:listview_app/animalItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
  // extension 과 같은 with
  with SingleTickerProviderStateMixin {
    late TabController controller;
    List<Animal> animalList = [];

  //시작할때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // vsync : 어느페이지에 들어가는지 정의하는 것

    animalList.add(Animal(
      animalName: '벌',
      kind: '곤충',
      imagePath: 'images/bee.png',
      flyExist: true
    ));
    animalList.add(Animal(
      animalName: '고양이',
      kind: '포유류',
      imagePath: 'images/cat.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '젖소',
      kind: '포유류',
      imagePath: 'images/cow.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '강아지',
      kind: '포유류',
      imagePath: 'images/dog.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '여우',
      kind: '포유류',
      imagePath: 'images/fox.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '원숭이',
      kind: '영장류',
      imagePath: 'images/monkey.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '돼지',
      kind: '포유류',
      imagePath: 'images/pig.png',
      flyExist: false
    ));
    animalList.add(Animal(
      animalName: '늑대',
      kind: '포유류',
      imagePath: 'images/wolf.png',
      flyExist: false
    ));
  }

  // 죽을때
  @override
  void dispose() {
    // TODO: implement dispose
    // 안해주면 쓰레기가 쌓인다
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Test'),
      ),
      body: TabBarView(
        // 이동해야 할 페이지
        children: [
          FirstPage(
            list: animalList,
          ), SecondPage(
            list: animalList,
          )
       ],
      controller: controller,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: 'Page #1',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
            text: 'Page #2',
          ),
        ],
        controller: controller,
      ),
    );
  }
}