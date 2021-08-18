import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              print("Shopping Cart is clicked");
            },
            icon: Icon(Icons.shopping_cart)
          ),
          IconButton(
            onPressed: (){
              print("Search is clicked");
            },
            icon: Icon(Icons.search)
          ),
        ],
      ),
      // drawer 아이콘 설정은 따로 안해줘도 된다
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/1.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/2.png'),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/3.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text('Pikachu'), 
              accountEmail: Text('pikachu@naver.com'),
              onDetailsPressed: (){
                print("main page is clicked");
              },
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Home'),
              onTap: (){
                print('Home is cilcked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: Text('설정'),
              onTap: (){
                print('설정 is cilcked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.red,
              ),
              title: Text('자주 묻는 질문'),
              onTap: (){
                print('자주 묻는 질문 is cilcked');
              },
            ),
          ],
        ),
      ),
    );
  }
}