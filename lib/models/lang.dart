class Lang {
  int id;
  String key;
  String pt;
  String fr;
  String gl;
  String lt;
  String ru;
  String hl;

  Lang({
    this.id,
    this.key,
    this.pt,
    this.fr,
    this.gl,
    this.lt,
    this.ru,
    this.hl,
  });

  Lang fromJson(Map<String, dynamic> json) {
    return Lang(
      id: json["id"] as int,
      key: json["key"] as String,
      pt: json["pt"] as String,
      fr: json["fr"] as String,
      gl: json["gl"],
      lt: json["lt"],
      ru: json["ru"],
      hl: json["hl"],
    );
  }
}
