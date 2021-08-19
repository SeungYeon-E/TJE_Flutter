import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageName = ['flower_01.png','flower_02.png','flower_03.png','flower_04.png','flower_05.png','flower_06.png'];
  
  int currentIamge = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Image Swiping'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SimpleGestureDetector(
            onHorizontalSwipe: _onHorizontalSwipe,
            onVerticalSwipe: _onHorizontalSwipe,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(imageName[currentIamge]),
                Image.asset(
                  'images/${imageName[currentIamge]}',
                  width: 350.0,
                  height: 600.0,
                ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHorizontalSwipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.left){
        print('Left');
        currentIamge += 1;
        if (currentIamge >= imageName.length){
          currentIamge = 0;
        }
      }else {
        print('Rigth');
        currentIamge -= 1;
        if (currentIamge < 0){
          currentIamge = imageName.length - 1;
        }
      }
    });
  }
}
