class Reminder {
  int id;
  int hour;
  int minutes;
  String repeat;
  int enable;

  Reminder({
    required this.id,
    required this.hour,
    required this.minutes,
    required this.repeat,
    required this.enable,
  });

  Reminder fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json["id"] as int,
      hour: json["hour"] as int,
      minutes: json["minutes"] as int,
      repeat: json["repeat"],
      enable: json["enable"] as int,
    );
  }
}
