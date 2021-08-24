import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  TextEditingController? _productName;
  TextEditingController? _productSize;
  TextEditingController? _productWeight;
  TextEditingController? _productBag;
  TextEditingController? _productColor;

  String productName = "맥북프로";
  int productSize = 16;
  double productWeight = 2.56;
  bool productBag = false;
  String productColor = "백";

  @override
  void initState() {
    super.initState();
    _productName = TextEditingController();
    _productSize = TextEditingController();
    _productWeight = TextEditingController();
    _productBag = TextEditingController();
    _productColor = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Computer 사양',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                      Container(
                        child: Text('제품명 : '),
                        width: 90,
                      ),
                      // 이게 뭐랑 비슷하다구..?
                      Container(
                        child: CupertinoTextField(
                          controller: _productName,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '제품명',
                          readOnly: true,
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                      Container(
                        child: Text('화면크기 : '),
                        width: 90,
                      ),
                      // 이게 뭐랑 비슷하다구..?
                      Container(
                        child: CupertinoTextField(
                          controller: _productSize,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          placeholder: '화면크기',
                          readOnly: true,
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                      Container(
                        child: Text('무게 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productWeight,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          // ios
                          placeholder: '무게',
                          readOnly: true,
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                      Container(
                        child: Text('가방 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productBag,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          // ios
                          placeholder: '가방',
                          readOnly: true,
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // container는 크기를 줄수 있어서 좋다 하지만 child는 한개뿐
                      Container(
                        child: Text('색상 : '),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _productColor,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          // ios
                          placeholder: '색상',
                          readOnly: true,
                        ),
                        width: 150,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(child: Text('OK'), onPressed: (){
                _productName!.text = productName;
                _productSize!.text = productSize.toString();
                _productWeight!.text = productWeight.toString();
                _productBag!.text = productBag.toString();
                _productColor!.text = productColor;
              }),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(child: Text('Clear'), onPressed: (){
                _productName!.clear();
                _productSize!.clear();
                _productWeight!.clear();
                _productBag!.clear();
                _productColor!.clear();
              }),
            ],
          ),
        ),
      ),
    );
  }
}