import 'package:flutter/material.dart';
import 'package:listview_ex_app/worldItem.dart';

class SecondPage extends StatefulWidget {
  final List<World> list;
  const SecondPage({ Key? key, required this.list }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final nameController = TextEditingController();
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "정답을 입력해주세요!",
                  ),
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                
                // child 하나 뿐이 못쓴다. 하지만 width와 heigth 사용할수있음
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/america.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/america.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/austria.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/austria.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/belgium.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/belgium.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/canada.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/canada.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/china.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/china.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/estonia.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/estonia.png";
                        },
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                  onPressed: (){
                    var country = World(
                      countryName: nameController.text,
                      imagePath: _imagePath,
                    ); //데이터만들기
                    AlertDialog dialog = AlertDialog(
                      title: Text("문제 추가하기"),
                      content: Text('이 국기의 문제는 ${country.countryName[0]}____ 입니다.\n'
                      '이 문제의 정답은 ${country.countryName}입니다. \n'
                      '이 문제를 추가하시겠습니까?',
                      style: TextStyle(fontSize: 17.0),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: (){
                            // widget 써줘야 함다!! 
                            widget.list.add(country);
                            Navigator.of(context).pop();
                          },
                          child: Text('예')
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                          ),
                          onPressed: (){
                            // widget 써줘야 함다!! 
                            Navigator.of(context).pop();
                          },
                          child: Text('아니오')
                        ),
                      ],
                    ); //다이얼로그 만들기

                    showDialog(
                      context: context, builder: (BuildContext context){
                        return dialog;
                      }
                    ); //다이얼로그 띄우기
                  },
                  child: Text("문제 추가하기")
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

// ------------------

