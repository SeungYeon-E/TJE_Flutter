// async가 없으면 await 못써
void main() async{
  await getVersionName().then((value) => {print(value)});
  print("end process");
}

Future<String> getVersionName() async{
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName(){
  return "Flutter";
}