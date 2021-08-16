void main(){
  checkVersion();
  print('end process');
}

// Future & async 비동기 처리 방식
Future checkVersion() async{
  print("--------");
  // await 다 끝난다음 실행된다고 생각하면 된다.(대기상태)
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion(){
  return 12;
}