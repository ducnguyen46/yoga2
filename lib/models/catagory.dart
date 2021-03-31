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
  String shortDescription; // short_description

  Category({
    this.id,
    this.name,
    this.namefit,
    this.count,
    this.type,
    this.enableDelete,
    this.lock,
    this.image,
    this.mark,
    this.description,
    this.shortDescription,
  });

  Category fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] as int,
      name: json["name"] as String,
      namefit: json["namefit"] as String,
      count: json["count"] as int,
      type: json["type"] as String,
      enableDelete: json["enable_delete"] as int,
      lock: json["lock"] as int,
      image: json["image"] as String,
      mark: json["mark"] as int,
      description: json["description"] as String,
      shortDescription: json["short_description"] as String,
    );
  }
}
