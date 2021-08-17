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
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('영웅 Card'),
        backgroundColor: Colors.orange[800],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/card.jpeg'),
                radius: 80.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Divider(
                height: 30.0,
                color: Colors.grey[700],
                thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Text("성웅",
                   style: TextStyle(
                     color: Colors.white, 
                     letterSpacing: 2.0,
                    ),
                ),
              ],
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Text("이순신 장군",
                   style: TextStyle(
                     color: Colors.white, 
                     letterSpacing: 2.0,
                     fontSize: 28.0,
                     fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Text("전적",
                   style: TextStyle(
                     color: Colors.white, 
                     letterSpacing: 2.0,
                    ),
                ),
              ],
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Text("62전 62승",
                   style: TextStyle(
                     color: Colors.orange[800], 
                     letterSpacing: 2.0,
                     fontSize: 28.0,
                     fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline_rounded),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("옥포 해전",
                     style: TextStyle(
                       fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline_rounded),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("사천 해전",
                     style: TextStyle(
                       fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline_rounded),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("한산도 대첩",
                     style: TextStyle(
                       fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline_rounded),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("부산 해전",
                     style: TextStyle(
                       fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
            child: Row(
              children: [
                Icon(Icons.check_circle_outline_rounded),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text("명량 대첩",
                     style: TextStyle(
                       fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Image.asset('images/turtle.gif',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}