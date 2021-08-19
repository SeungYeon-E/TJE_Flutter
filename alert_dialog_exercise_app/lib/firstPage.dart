import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert and push"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            _showDialog(context);
          },
          child: Text("Move the 2nd page!"),
          ),
      ),
    );
  }
}

void _showDialog(BuildContext context){
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Page 이동'),
        content: Text('아래의 버튼을 누르면 페이지 이동합니다.'),
        actions: [
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/next");
            },
            child: Text("Page 이동"),
          ),
        ],
      );
    },
  );
}