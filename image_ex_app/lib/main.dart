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
        title: Text("Image Ex"),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'images/1.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            Image.asset(
              'images/2.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/3.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}