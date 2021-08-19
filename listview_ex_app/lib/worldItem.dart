class World{
  late String imagePath;
  late String countryName;

  World(
    {
      // required 이거 없으면 가짜야
      required this.countryName,
      required this.imagePath
    }
  );
}