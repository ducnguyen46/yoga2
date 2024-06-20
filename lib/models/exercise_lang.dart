class ExerciseLang {
  final String key;
  final String pt;
  final String fr;
  final String it;
  final String ru;

  ExerciseLang({
    required this.key,
    required this.pt,
    required this.fr,
    required this.it,
    required this.ru,
  });

  factory ExerciseLang.fromJson(Map<String, dynamic> json) {
    return ExerciseLang(
      key: json["key"],
      pt: json["pt"],
      fr: json["fr"],
      it: json["it"],
      ru: json["ru"],
    );
  }
}
