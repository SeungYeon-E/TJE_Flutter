import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_mypage/orderlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

class MyPage extends StatefulWidget {
  final String rUserName;
  const MyPage({ Key? key, required this.rUserName}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState(rUserName);
}

class _MyPageState extends State<MyPage> {
  TextEditingController nameController = TextEditingController();

  // Create Constructor
  late String userName;

  _MyPageState(String rUserName){
    this.userName = rUserName;
  }

  late List data;

  //앱을 실행하자마자 불러와서 화면에 띄울거야
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
        middle: Text('MyPage'),
        ),
         child: Column(
           children: [
            SizedBox(
              height: 100,
            ),
             Center(
             child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                  radius: 50.0,
                ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Text(
                    userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('갯수'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('구매후기')
                       ],
                     )
                     ,
                     height: 100,
                     width: 100,
                   ),
                   SizedBox(
                     width: 30,
                   ),
                   Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('갯수'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('주문상품')
                       ],
                     )
                     ,
                     height: 100,
                     width: 100,
                   ),
                   SizedBox(
                     width: 30,
                   ),
                   Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('갯수'),
                        SizedBox(
                          height: 30,
                        ),
                        Text('장바구니')
                       ],
                     )
                     ,
                     height: 100,
                     width: 100,
                   ),
                 ],
               ),
               Divider(
                height: 30.0,
                color: Colors.grey[700],
                thickness: 0.5,
              ),
              GestureDetector(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Text('주문목록 / 배송조회',
                            ),
                          ],
                        ),
                        width: 350,
                        height: 60,
                      ),
                    ),
                    Text('〉')
                  ],
                ),
                onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                    return OrderList();
                  }));
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        children: [
                          Text('주문 취소 목록',
                          ),
                        ],
                      ),
                      width: 350,
                      height: 60,
                    ),
                  ),
                  Text('〉')
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        children: [
                          Text('리뷰 등록',
                          ),
                        ],
                      ),
                      width: 350,
                      height: 60,
                    ),
                  ),
                  Text('〉')
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      child: Row(
                        children: [
                          Text('리뷰 삭제',
                          ),
                        ],
                      ),
                      width: 350,
                      height: 60,
                    ),
                  ),
                  Text('〉')
                ],
              ),

             ],
             ),
           ),
           ],
         ),
      ),
    );
  }
  // 안에 넣는 이유는 setState쓰기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter_Market/student_query_flutter.jsp');
    // asysc라 await 써준다
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      // 리스트 지우기
      data.clear();
      var dataConvertedJSON = json.decode(response.body);
      List result = dataConvertedJSON['results'];
      // print(result);
      data.addAll(result);
    });

    return "a";
  }
}