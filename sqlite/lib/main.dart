import 'package:flutter/material.dart';
import 'package:sqlite/databaseHandler.dart';
import 'package:sqlite/insertStudents.dart';
import 'package:sqlite/students.dart';

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
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();

    // Temp Action (확인 끝나고 whenComplete 뭐할까)
    handler.initializeDB().whenComplete(() async{
      await addStudents();
      // 추가해줘야 나와... 이게뭐여
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite for Students'),
        actions: [
          IconButton(
            onPressed: (){ 
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InsertStudents();
              })).then((value) => reloadData());
            }, 
            icon: Icon(Icons.add_a_photo_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryStudents(),
        builder: (BuildContext context, AsyncSnapshot<List<Students>> snapshot){
          // 데이타 있니 없니
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete_forever,
                    size: 70,
                    color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) async{
                    // 데이터 지우기
                    await handler.deleteStudents(snapshot.data![index].id!);
                    setState(() {
                      // 화면 정리
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  key: ValueKey<int>(snapshot.data![index].id!),
                  child: GestureDetector(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Code : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(snapshot.data![index].code)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Name : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(snapshot.data![index].name)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Dept : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(snapshot.data![index].dept)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(snapshot.data![index].phone)
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return updateStudents(
                      //     rcode: snapshot.data![index].code,
                      //     rname: snapshot.data![index].name,
                      //     rdept: snapshot.data![index].dept,
                      //     rphone: snapshot.data![index].phone,
                      //   );
                      // })).then((value) => reloadData());
                    },
                  ),
                );
              }
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<int> addStudents() async{
    Students firstStudent = Students(code: '1111', name: '유비', dept: '컴퓨터공학과', phone: '1111');
    Students secondStudent = Students(code: '2222', name: '관우', dept: '심리학과', phone: '2222');
    Students thirdStudent = Students(code: '3333', name: '장비', dept: '시각디자인학과', phone: '3333');

    List<Students> listOfStudents = [firstStudent, secondStudent, thirdStudent];
    // 한번에 들어간다... 대박사건 for문 안써두 댐..
    return await handler.insertStudents(listOfStudents);
  }
  void reloadData(){
    setState(() {
      handler.queryStudents();
    });
  }
}