import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

class OrderList extends StatefulWidget {
  final String rUserID;
  const OrderList({ Key? key, required this.rUserID }) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState(rUserID);
}

class _OrderListState extends State<OrderList> {
  // Create Constructor
  late String userID;

  _OrderListState(String rUserID){
    this.userID = rUserID;
  }

  late List data;

  //앱을 실행하자마자 불러와서 화면에 띄울거야
  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
    
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'My Page',
            onPressed: (){
              // Message.contents = _messageBox!.text;
              Navigator.pop(context);
            },
          ),
          middle: Text('주문목록'),
        ),
        child: Container(
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
                return GestureDetector(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('주문일자 : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['buyDay'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('주문번호 : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['orderNumber'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('주문목록 : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['buyName'].toString()),
                              Text(' 외 ${data[index]['buyCount'].toString()} 개'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('주문상태 : ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(data[index]['deliveryCondition'].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: (){
                    // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context){
                    //   return UpdateStudent(
                    //     rcode: data[index]['code'].toString(),
                    //     rname: data[index]['name'].toString(),
                    //     rdept: data[index]['dept'].toString(),
                    //     rphone: data[index]['phone'].toString(),
                    //   );
                    // })).then((value) => getJSONData());
                  },
                  onLongPress: (){
                  //   Navigator.push(context, 
                  //   MaterialPageRoute(builder: (context){
                  //     return DeleteStudent(
                  //       rcode: data[index]['code'].toString(),
                  //       rname: data[index]['name'].toString(),
                  //       rdept: data[index]['dept'].toString(),
                  //       rphone: data[index]['phone'].toString(),
                  //     );
                  //   })).then((value) => getJSONData());
                  },
                );
              },
              itemCount: data.length,
            ),
        ),
      ),
      ),
    );
  }
  // 안에 넣는 이유는 setState쓰기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter_Market/mypage_orderlist_query_flutter.jsp?CustomerId=${userID}');
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