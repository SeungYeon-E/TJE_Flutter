import 'package:flutter/material.dart';

class ScreenSend extends StatelessWidget {
  const ScreenSend({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Mail'),
        backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: Text(
              '유비에게 보낸 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
              '관우에게 보낸 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
              '장비에게 보낸 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
        ],
      ),
    );
  }
}