import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animalItem.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({ Key? key, required this.list }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
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
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio(
                      value: 0, 
                      // 그룹 잡아놓은거야
                      groupValue: _radioValue, 
                      onChanged: _radioChange,
                    ),
                    Text('양서류'),
                    Radio(
                      value: 1, 
                      // 그룹 잡아놓은거야
                      groupValue: _radioValue, 
                      onChanged: _radioChange,
                    ),
                    Text('파충류'),
                    Radio(
                      value: 2, 
                      // 그룹 잡아놓은거야
                      groupValue: _radioValue, 
                      onChanged: _radioChange,
                    ),
                    Text('포유류'),
                 ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('날 수 있나요?'),
                    Checkbox(
                      value: flyExist ,
                      onChanged: (check){
                        setState(() {
                          flyExist = check!;
                        });
                      },
                    ),
                  ],
                ),
                // child 하나 뿐이 못쓴다. 하지만 width와 heigth 사용할수있음
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          'images/cow.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/cow.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/pig.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/pig.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/bee.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/bee.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/cat.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/cat.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/fox.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/fox.png";
                        },
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'images/monkey.png',
                          width: 80,
                        ),
                        onTap: (){
                          _imagePath = "images/monkey.png";
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
                    var animal = Animal(
                      animalName: nameController.text,
                      kind: getKind(_radioValue),
                      imagePath: _imagePath,
                      flyExist: flyExist,
                    ); //데이터만들기
                    AlertDialog dialog = AlertDialog(
                      title: Text("동물 추가하기"),
                      content: Text('이 동물은 ${animal.animalName} 입니다.'
                      '이 동물의 종류는 ${animal.kind}입니다. \n'
                      '이 동물을 추가하시겠습니까?',
                      style: TextStyle(fontSize: 17.0),
                      ),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: (){
                            // widget 써줘야 함다!! 
                            widget.list.add(animal);
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
                  child: Text("동물 추가하기")
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
  _radioChange(int? value){
    setState(() {
      _radioValue = value!;
    });
  }

  getKind(int radioValue){
    // flutter는 python과 같이 break문 없어
    switch(radioValue){
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}

// ------------------

