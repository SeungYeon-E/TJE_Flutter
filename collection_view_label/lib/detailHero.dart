import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHero extends StatefulWidget {
  final String rcontentList;

  const DetailHero({ Key? key, required this.rcontentList }) : super(key: key);

  @override
  _DetailHeroState createState() => _DetailHeroState(rcontentList);
}

class _DetailHeroState extends State<DetailHero> {
  // Create Constructor
  late String contentList;

  _DetailHeroState(String rcontentList){
    this.contentList = rcontentList;
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
              Text(contentList),
            ],
          ),
        ),
      ),
    );
  }
}