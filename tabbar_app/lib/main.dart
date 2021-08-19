import 'package:flutter/material.dart';
import 'package:tabbar_app/firstPage.dart';
import 'package:tabbar_app/secondPage.dart';

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

  //시작할때
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    // vsync : 어느페이지에 들어가는지 정의하는 것
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
        title: Text('Tab Bar Test'),
      ),
      body: TabBarView(
        // 이동해야 할 페이지
        children: [
          FirstPage(), SecondPage()
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