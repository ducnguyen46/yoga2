class Category {
  int id;
  String name;
  String namefit;
  int count;
  String type;
  int enableDelete; // enable_delete
  int lock;
  String image;
  int mark;
  String description;
  String? shortDescription; // short_description

  Category({
    required this.id,
    required this.name,
    required this.namefit,
    required this.count,
    required this.type,
    required this.enableDelete,
    required this.lock,
    required this.image,
    required this.mark,
    required this.description,
    this.shortDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"] as String,
      namefit: json["namefit"] as String,
      count: json["count"] as int,
      type: json["type"] as String,
      enableDelete: json["enable_delete"] as int,
      lock: json["lock"] as int,
      image: json["image"] as String,
      mark: json["mark"] as int,
      description: json["description"] as String,
      shortDescription: json["short_description"],
    );
  }
}
