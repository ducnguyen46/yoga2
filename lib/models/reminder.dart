class Reminder {
  int id;
  int hour;
  int minutes;
  String repeat;
  int enable;

  Reminder({
    this.id,
    this.hour,
    this.minutes,
    this.repeat,
    this.enable,
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
