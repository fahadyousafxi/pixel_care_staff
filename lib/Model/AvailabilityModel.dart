


class AvailbilityModel {
  AvailbilityModel({
    required this.status,
    required this.message,
    required this.userId,
    required this.data,
  });

  int status;
  String message;
  int userId;
  List<Data> data;

  factory AvailbilityModel.fromJson(Map<String, dynamic> json) => AvailbilityModel(
    status: json["status"],
    message: json["message"],
    userId: json["user_id"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user_id": userId,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.date,
    required this.scheduleList,
     required this.id,
  });

  String date;
  String scheduleList;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    date: json['date'],
    scheduleList: json["schedule_list"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "schedule_list": scheduleList,
    "id": id,
  };
}
