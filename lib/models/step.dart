class Step {
  int id;
  String name;
  String image;
  String description;

  Step({
    this.id,
    this.name,
    this.image,
    this.description,
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
