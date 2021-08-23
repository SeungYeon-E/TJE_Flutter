import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

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
  String result = '';
  late List data;

  //앱을 실행하자마자 불러와서 화면에 띄울거야
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Test'),
      ),
      body: Center(
        child: Container(
          height: 400,
          child: Center(
            // 삼항 연산자
            child: data.length == 0
              ? Text(
                '데이터가 없습니다.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )
              : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                data[index]['image'],
                                height: 300,
                                width: 300,
                                fit: BoxFit.contain,
                              ),
                              // Text('title : ',
                              //   style: TextStyle(fontWeight: FontWeight.bold),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(data[index]['title'].toString(),
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: data.length,
              ),
          ),
        ),
      ),
    );
  }

  // 안에 넣는 이유는 setState쓰기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter/movies.json');
    // asysc라 await 써준다
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      // 한글 관련 utf8로 decode
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      // print(result);
      data.addAll(result);
    });

    return "a";
  }
}