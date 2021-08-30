import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table/detailList.dart';
import 'package:table/insertList.dart';
import 'package:table/message.dart';
import 'package:table/todoList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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

  late List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoList(imagePath: 'images/bee.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/cat.png', workList: '철수와 약속'));
    todoList.add(TodoList(imagePath: 'images/dog.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('MainView'),
        trailing: Material(
          child: IconButton(
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context){
                return InsertList();
              })).then((value) => rebuildData());
              // => 이모양이 (){} 이모양이야
            },
            icon: Icon(Icons.add),
          )
        ),
      ),
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: GestureDetector(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            todoList[index].imagePath,
                            fit: BoxFit.contain,
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(child: Text(todoList[index].workList))
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailList(rcontentList: todoList[index].workList.toString(), rcontentImage: todoList[index].imagePath.toString());
                  }));
                },
              ),
              height: 80,
            ),
          );
        },
      ),
    );
  }
  void rebuildData(){
    setState(() {
      todoList.add(TodoList(imagePath: Message.insertImagepath, workList: Message.insertData));
    });
  }
}