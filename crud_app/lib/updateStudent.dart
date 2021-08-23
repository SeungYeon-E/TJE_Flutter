import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateStudent extends StatefulWidget {
  final String rcode;
  final String rname;
  final String rdept;
  final String rphone;
  
  const UpdateStudent({ Key? key, required this.rcode, required this.rname, required this.rdept, required this.rphone }) : super(key: key);

  @override
  _UpdateStudentState createState() => _UpdateStudentState(rcode, rname, rdept, rphone);
}

class _UpdateStudentState extends State<UpdateStudent> {
  late String code;
  late String name;
  late String dept;
  late String phone;
  String result = '';
  late List data;

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  _UpdateStudentState(String rcode, String rname, String rdept, String rphone){
    this.code = rcode;
    this.name = rname;
    this.dept = rdept;
    this.phone = rphone;
  }

  @override
  void initState() {
    super.initState();
    codeController.text = this.code;
    nameController.text = this.name;
    deptController.text = this.dept;
    phoneController.text = this.phone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update for CRUD')
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: TextField(
                      controller: codeController,
                      decoration: InputDecoration(labelText: '학번 입니다.'),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "성명을 입력하세요!"
                          ),
                          keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: TextField(
                          controller: deptController,
                          decoration: InputDecoration(
                            labelText: "전공을 입력하세요!"
                          ),
                          keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: "전화번호를 입력하세요!"
                          ),
                          keyboardType: TextInputType.text,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if(codeController.text.isEmpty || nameController.text.isEmpty){
                       showSnackBar(context);
                      }else{
                        getJSONData();
                      }
                    },
                    child: Text('입력')
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 안에 넣는 이유는 setState쓰기 위해
  Future<String> getJSONData() async{
    var url = Uri.parse('http://localhost:8080/Flutter/student_update_return_flutter.jsp?code=${codeController.text}&name=${nameController.text}&dept=${deptController.text}&phone=${phoneController.text}');
    // print(url);
    // asysc라 await 써준다
    var response = await http.get(url);
    // print(response.body);
    setState(() {
      // 한글 관련 utf8로 decode
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      // var dataConvertedJSON = json.decode(response.body);
      result = dataConvertedJSON['result'];
      // print(result);
      // data.addAll(result);
      if (result == "OK"){
        _showDialog(context);
      }else{
        failSnackBar(context);
      }
    });

    return "a";
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("사용자 정보를 입력해주세요!"),
      backgroundColor: Colors.teal,
      )
    );
  }
  void failSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      content: Text("사용자 정보 입력에 문제가 발생 하였습니다."),
      backgroundColor: Colors.redAccent,
      )
    );
  }
  void _showDialog(BuildContext context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('수정 결과'),
          content: Text('수정이 완료 되었습니다.'),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
                Navigator.pop(context); // Main화면으로 이동
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

}