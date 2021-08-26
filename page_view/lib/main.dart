import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _imageFile = ['flower_01.png', 'flower_02.png', 'flower_03.png'];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // pageview는 빌드할때 세팅해줘야한다.
    final PageController controller = PageController(initialPage: 0);
    // PageView 스크롤 하면서 입력도 가능!!
    return PageView(
      // 스크롤 방향
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: [
        // 첫번째 페이지
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${_imageFile[_currentPage]}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage]}',
                fit: BoxFit.contain,
                width: 380,
                height: 600,
              )
            ],
          ),
        ),
        // 두번째 페이지
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${_imageFile[_currentPage + 1]}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage + 1]}',
                fit: BoxFit.contain,
                width: 380,
                height: 600,
              )
            ],
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${_imageFile[_currentPage + 2]}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'images/${_imageFile[_currentPage + 2]}',
                fit: BoxFit.contain,
                width: 380,
                height: 600,
              )
            ],
          ),
        ),
      ],
    );
  }
}