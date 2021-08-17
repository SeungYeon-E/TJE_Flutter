// body와 funcion부분

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//class 이름 신경써
class MyToast extends StatelessWidget {
  const MyToast({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)
          ),
          onPressed: (){
            toastAction();
            // Fluttertoast.showToast(
            //   msg: "Toast Button is clicked",
            //   backgroundColor: Colors.pink[200],
            //   textColor: Colors.white,
            //   fontSize: 14.0,
            //   toastLength: Toast.LENGTH_SHORT,
            // );
          },
          child: Text('Toast Button'),
      ),
    );
  }
}
// Toast Action

void toastAction(){
  Fluttertoast.showToast(
    msg: "Toast Button is clicked",
    backgroundColor: Colors.pink[200],
    textColor: Colors.white,
    fontSize: 14.0,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
  );
}