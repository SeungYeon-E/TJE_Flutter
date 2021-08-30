import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  final String rcontentImage;

  const DetailList({ Key? key, required this.rcontentImage }) : super(key: key);

  @override
  _DetailListState createState() => _DetailListState(rcontentImage);
}

class _DetailListState extends State<DetailList> {
  // Create Constructor
  late String contentImage;

  _DetailListState(String rcontentImage){
    this.contentImage = rcontentImage;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'MainView',
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          middle: Text('Detail View'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Image.asset(contentImage),
                width: 400,
                height: 450,
              )
            ],
          ),
        ),
      ),
    );
  }
}