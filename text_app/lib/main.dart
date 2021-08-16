import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      // 디버그 모드가 없어진다.
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // layout
    return Scaffold(
      appBar: AppBar(
        title: Text("Text App"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        // 밑으로 쌓는것
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("유비"),
            SizedBox(
              height: 50.0,
            ),
            Text("장비"),
            Text("관우"),
          ],
        ),
      ),
    );
  }
}