import 'package:flutter/material.dart';
import 'package:textfield_login_app/coin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  // textfield 마다 controller 필요! (tf 여러 개면 controller도 여러 개 생성해야 함!)
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  // snackbar 함수에 보낼 변수
  late String inputValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Log In'),
       ),
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: CircleAvatar(
                  backgroundImage: AssetImage('images/card.jpeg'),
                  radius: 80.0,
                ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                      // 데이터 주고받기에 controller가 필요함!
                      controller: idController,
                      decoration: InputDecoration(
                        // hint
                        labelText: '사용자 ID 입력하세요.',
                      ),
                      // TextInputType.number : 숫자 키보드
                      keyboardType: TextInputType.text,
                  ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: TextField(
                      // 데이터 주고받기에 controller가 필요함!
                      controller: pwController,
                      decoration: InputDecoration(
                        // hint
                        labelText: '패스워드를 입력하세요.',
                      ),
                      // TextInputType.number : 숫자 키보드
                      keyboardType: TextInputType.text,
                      obscureText: true,
                  ),
               ),
               ElevatedButton(
                 onPressed: (){
                   // tf 에 데이터 있는지 check
                    if (idController.text == "" || idController.text.isEmpty || pwController.text == "" || pwController.text.isEmpty)  {
                      errorSnackBar(context);
                    }else{
                      inputValue = idController.text;
                      showSnackBar(context, inputValue);
                    }
                 },
                 child: Text('Log In')
                ),
             ],
           ),
         ),
       ),
    );
  }
}


void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("사용자ID와 암호를 입력해주세요!"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.redAccent,
      ),
  );
}

void showSnackBar(BuildContext context, String inputValue) {
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('환영합니다!!'),
        content: Text('$inputValue 확인 되었습니다!'),
        actions: [
          ElevatedButton(
            onPressed: (){
              // Navigator.of(context).pop();
              // Navigator.pushNamed(context, "/next");
              Navigator.push(
              context,MaterialPageRoute(builder: (context){
               return Coin(id: inputValue);
             }),
              );
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
