class Dog {
  String bredFor;
  String breedGroup;
  Map<String, String> height = {};
  int id;
  String lifeSpan;
  String name;
  String origin;
  String temperament;
  Map<String, String> weight = {};
  String imageUrl;

  Dog(
      {this.bredFor,
      this.breedGroup,
      this.id,
      this.lifeSpan,
      this.name,
      this.origin,
      this.temperament});
}
