class Location {
  late int id;
  late String name;
  late String imageUrl;
  bool isPopuler;

  Location({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isPopuler = false,
  });
}
