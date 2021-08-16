void main() {
  List threeKingdoms = [];
  threeKingdoms.add("위");
  threeKingdoms.add("촉");
  threeKingdoms.add("오");

  print(threeKingdoms);

  threeKingdoms[0] = "We";
  print(threeKingdoms);

  threeKingdoms.remove("We");
  print(threeKingdoms);

  threeKingdoms.removeAt(0);
  print(threeKingdoms);
  print(threeKingdoms.length);

  threeKingdoms.add(1);
  threeKingdoms.add(2);
  print(threeKingdoms);

  List<String> threeKingdoms2 = [];
  threeKingdoms2.add("위");
  threeKingdoms2.add("촉");

  List<String> threeKingdoms3 = ['위', '촉', '오'];
  print(threeKingdoms3);

  Map<String, int> fruitPrice = {
    'apple' : 1000,
    'grape': 2000,
    "watermelon": 3000
  };

  print(fruitPrice['apple']);

  // Optional : Null Safety
  int num1 = 10;

  int? num2 = null;
  num2 ??= 8;
  print(num2);

  List<int> list1 = [1, 3, 5, 7, 9];
  int sum = 0;
  for (int i in list1){
    sum += 1;
  }
  print("합계 : $sum");
}