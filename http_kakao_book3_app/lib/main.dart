import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String result = '';
  late List data;
  late TextEditingController _editingController;
  late ScrollController _scrollController;

  int page = 1;

  //앱을 실행하자마자 불러와서 화면에 띄울거야
  @override
  void initState() {
    super.initState();
    data = [];
    _editingController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if(_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange){
        // print('bottom');
        page++;
        getJSONData();
      }
    });
    // getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: TextField(
                  controller: _editingController,
                  decoration: InputDecoration(
                    labelText: "책 이름을 입력하세요!"
                  ),
                  keyboardType: TextInputType.text,
              ),
        ),
      ),
      body: Container(
        child: Center(
          // 삼항 연산자
          child: data.length == 0
            ? Text(
              '데이터가 없습니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
            : ListView.builder(
              itemBuilder: (context, index){
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            data[index]['thumbnail'].toString().length > 0
                                ? Image.network(
                                data[index]['thumbnail'],
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                              )
                                : Image.network(
                                'https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F1104126%3Ftimestamp%3D20210820152159',
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                            // Image.network(
                            //     data[index]['thumbnail'],
                            //     height: 100,
                            //     width: 100,
                            //     fit: BoxFit.contain,
                            //   ),
                              Column(
                                //column은 main이 y축, cross x축
                                //row는 main이 x축, cross y축
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 글자수에 따른 ... 주기
                                data[index]['title'].toString().length < 7
                                ? Text(
                                  data[index]['title'].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                )
                                : Text(
                                  data[index]['title'].toString().replaceRange(7, data[index]['title'].toString().length, '...'),
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                // Text(data[index]['title'].toString(),
                                // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                // ),
                                Text(data[index]['authors'].toString()),
                                Text(data[index]['sale_price'].toString()),
                                Text(data[index]['status'].toString()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: data.length,
              // 이벤트 발생시키기위함
              controller: _scrollController,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          page = 1;
          //리스트 비워주기
          data.clear();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async{
    var url = Uri.parse(
      // 예전엔 _editingController.value.text -> _editingController.text
      'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=${_editingController.text}'
    );
    var response = await http.get(url,
      headers: {"Authorization" : "KakaoAK f71c9d2acfa214884882c0c2532e8b1f"}
    );
    print(response.body);
    setState(() {
      // 한글 관련 utf8로 decode
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      // var dataConvertedJSON = json.decode(response.body);
      List result = dataConvertedJSON['documents'];
      // print(result);
      data.addAll(result);
    });
    return "Succese";
  }
}
