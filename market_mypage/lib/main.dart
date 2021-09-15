import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_mypage/mainpage.dart';
import 'package:market_mypage/mypage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
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
  late CupertinoTabBar tabBar;

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(CupertinoIcons.home),
        ),
        BottomNavigationBarItem(
          label: 'MyPage',
          icon: Icon(CupertinoIcons.person),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: (context, value){
          if(value == 0){
            return MainPage();
          }else{
            return MyPage(rUserID: 'paul123');
          }
        },
      ),
    );
  }
}