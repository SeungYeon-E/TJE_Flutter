import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/1.png'),
                backgroundColor: Colors.white,
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/2.png'),
                backgroundColor: Colors.white,
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/3.png'),
                backgroundColor: Colors.white,
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}