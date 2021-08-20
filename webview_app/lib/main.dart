import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  TextEditingController textController = TextEditingController();

  bool isLoading = true; // for indicator
  String url = 'www.daum.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
          child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: "Site이름을 입력하세요!"
                      ),
                      keyboardType: TextInputType.text,
                  ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                url = textController.text;
                _controller.future
                //reload 해주는 then
                .then((value) => value.loadUrl('https://$url'));
              });
            }, 
            icon: Icon(Icons.search_outlined)
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$url',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start){
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
            ? Center(
              child: CircularProgressIndicator(),
            )
            : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        // 다시 돌아오기위해 저장..future & sysc 맨끝에 실행된다
        future: _controller.future,
        // 메모리를 그대로 저장한다!!(AsyncSnapshot)
        builder: (BuildContext context, AsyncSnapshot<WebViewController> controller){
          if(controller.hasData){
            return FloatingActionButton(
              child: Icon(Icons.arrow_back),
              backgroundColor: Colors.redAccent,
              onPressed: (){
                controller.data!.goBack();
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}