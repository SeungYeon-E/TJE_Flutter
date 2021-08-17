
import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/1st');
            },
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/2nd');
            },
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/1st');
              },
              child: Text('보낸 편지함'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/2nd');
              },
              child: Text('받은 편지함'),
            ),
          ],
        ),
      ),

    );
  }
}