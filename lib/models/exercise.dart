class Exercise {
  int id;
  String name;
  String image;
  String description;
  String namefit;

  Exercise({
    this.id,
    this.name,
    this.image,
    this.description,
    this.namefit,
  });

  Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json["id"] as int,
      name: json["name"] as String,
      image: json["image"] as String,
      description: json["description"] as String,
      namefit: json["namefit"] as String,
    );
  }
}
