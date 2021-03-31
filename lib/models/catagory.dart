class Category {
  int id;
  String name;
  String namefit;
  String count;
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
}
