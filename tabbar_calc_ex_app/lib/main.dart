import 'package:flutter/material.dart';
import 'package:tabbar_calc_ex_app/FirstPage.dart';
import 'package:tabbar_calc_ex_app/secondPage.dart';

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
  with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('탭바를 이용한 덧셈계산 비교'),
      ),
      body: TabBarView(
        children: [
          FirstScreen(), SecondScreen()
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.purple,
        tabs: [
          Tab(
            icon: Icon(
              Icons.timer,
              color: Colors.blue,
            ),
            text: '덧셈계산 #1',
          ),
          Tab(
            icon: Icon(
              Icons.timer,
              color: Colors.blue,
            ),
            text: '덧셈계산 #2',
          ),
        ],
        controller: controller,
      ),
    );
  }
}