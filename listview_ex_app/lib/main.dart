import 'package:flutter/material.dart';
import 'package:listview_ex_app/firstPage.dart';
import 'package:listview_ex_app/secondPage.dart';
import 'package:listview_ex_app/worldItem.dart';

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
    List<World> countryList = [];

  //시작할때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // vsync : 어느페이지에 들어가는지 정의하는 것

    countryList.add(World(
      countryName: '미국',
      imagePath: 'images/america.png',
    ));
    countryList.add(World(
      countryName: '오스트리아',
      imagePath: 'images/austria.png',
    ));
    countryList.add(World(
      countryName: '벨기에',
      imagePath: 'images/belgium.png',
    ));
    countryList.add(World(
      countryName: '캐나다',
      imagePath: 'images/canada.png',
    ));
    countryList.add(World(
      countryName: '중국',
      imagePath: 'images/china.png',
    ));
    countryList.add(World(
      countryName: '에스토니아',
      imagePath: 'images/estonia.png',
    ));
    countryList.add(World(
      countryName: '프랑스',
      imagePath: 'images/france.png',
    ));
    countryList.add(World(
      countryName: '독일',
      imagePath: 'images/germany.png',
    ));
    countryList.add(World(
      countryName: '그리스',
      imagePath: 'images/greece.png',
    ));
    countryList.add(World(
      countryName: '헝가리',
      imagePath: 'images/hungary.png',
    ));
    countryList.add(World(
      countryName: '이탈리아',
      imagePath: 'images/italy.png',
    ));
    countryList.add(World(
      countryName: '한국',
      imagePath: 'images/korea.png',
    ));
    countryList.add(World(
      countryName: '라트비아',
      imagePath: 'images/latvia.png',
    ));
    countryList.add(World(
      countryName: '리투아니아',
      imagePath: 'images/lithuania.png',
    ));
    countryList.add(World(
      countryName: '룩셈부르크',
      imagePath: 'images/luxemburg.png',
    ));
    countryList.add(World(
      countryName: '네덜란드',
      imagePath: 'images/netherland.png',
    ));
    countryList.add(World(
      countryName: '루마니아',
      imagePath: 'images/romania.png',
    ));
    countryList.add(World(
      countryName: '터키',
      imagePath: 'images/turkey.png',
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
        title: Text('국가명 맞추기'),
      ),
      body: TabBarView(
        // 이동해야 할 페이지
        children: [
          FirstPage(
            list: countryList,
          ), 
          SecondPage(
            list: countryList,
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