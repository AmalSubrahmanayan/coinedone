class PhoneModel {
  PhoneModel({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.phoneNumber,
  });

  String name;
  String startTime;
  String endTime;
  String date;
  String phoneNumber;

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
        name: json["name"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        date: json["date"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
        "phoneNumber": phoneNumber,
      };
}
