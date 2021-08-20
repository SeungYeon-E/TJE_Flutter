import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animalItem.dart';

class FirstPage extends StatelessWidget {
  final List<Animal> list;
  const FirstPage({ Key? key, required this.list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Page'),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemBuilder: (context, position){
              return GestureDetector(
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].animalName)
                    ],
                  ),
                ),
                onTap: (){
                  _showDialog(context, list[position].kind, list[position].animalName);
                },
              );
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String kind, String name){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("$name"),
        content: Text("이 동물은 $kind 입니다."),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("종료")
          )
        ],
      );
    }
  );
}