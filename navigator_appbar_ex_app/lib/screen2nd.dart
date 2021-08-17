import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Mail'),
        backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: Text(
              '유비에게서 온 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
              '관우에게서 온 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Text(
              '장비에게서 온 메일', 
               style: TextStyle(color: Colors.black)
             ),
          ),
        ],
      ),
    );
  }
}