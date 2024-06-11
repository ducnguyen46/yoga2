class Step {
  int id;
  String name;
  String image;
  String description;

  Step({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  Step fromJson(Map<String, dynamic> json) {
    return Step(
      id: json["id"] as int,
      name: json["name"],
      image: json["image"],
      description: json["description"],
    );
  }
}
