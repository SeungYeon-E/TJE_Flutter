import 'package:crud_app/deleteStudent.dart';
import 'package:crud_app/insertStudent.dart';
import 'package:crud_app/updateStudent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

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
        title: Text('CRUD for Students'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InsertStudent();
              })).then((value) => getJSONData());
            }, 
            icon: Icon(Icons.add_outlined),
          )
        ],
      ),
      body: Container(
        child: Center(
          // 삼항 연산자
          child: data.length == 0
            ? Text(
              '데이터가 없습니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
            : ListView.builder(
              itemBuilder: (context, index){
                return GestureDetector(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Code : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['code'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Name : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['name'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Dept : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['dept'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Phone : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['phone'].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context){
                      return UpdateStudent(
                        rcode: data[index]['code'].toString(),
                        rname: data[index]['name'].toString(),
                        rdept: data[index]['dept'].toString(),
                        rphone: data[index]['phone'].toString(),
                      );
                    })).then((value) => getJSONData());
                  },
                  onLongPress: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context){
                      return DeleteStudent(
                        rcode: data[index]['code'].toString(),
                        rname: data[index]['name'].toString(),
                        rdept: data[index]['dept'].toString(),
                        rphone: data[index]['phone'].toString(),
                      );
                    })).then((value) => getJSONData());
                  },
                );
              },
              itemCount: data.length,
            ),
        ),
      ),
    );
  }

  // 안에 넣는 이유는 setState쓰기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    // asysc라 await 써준다
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      // 리스트 지우기
      data.clear();
      var dataConvertedJSON = json.decode(response.body);
      List result = dataConvertedJSON['results'];
      // print(result);
      data.addAll(result);
    });

    return "a";
  }
}