import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  final String id;
  const Coin({ Key? key, required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('$id'),
      ),
      body: Center(child: Image.asset('images/card.jpeg')),
    );
  }
}