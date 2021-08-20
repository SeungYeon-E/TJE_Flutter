class Animal{
  late String imagePath;
  late String animalName;
  late String kind;
  late bool flyExist;

  Animal(
    {
      // required 이거 없으면 가짜야
      required this.animalName,
      required this.kind,
      required this.imagePath,
      required this.flyExist
    }
  );
}