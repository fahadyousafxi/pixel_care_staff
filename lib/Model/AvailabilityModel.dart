

class AvailbilityModel {
  int? status;
  String? message;
  int? userId;
  List<Data> data = [];

  AvailbilityModel(
      {this.status, this.message, this.userId, required this.data});

  AvailbilityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userId = json['user_id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    if (this.data != null) {
      data['data'] = this
          .data
          .map((v) => v.toJson())
          .toList(); //remove this.data!.map((v) => v.toJson()).toList()
    }
    return data;
  }
}

class Data {
  String? date;
  String? scheduleList;
  int? id;

  Data({this.date, this.scheduleList, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    scheduleList = json['schedule_list'];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['schedule_list'] = this.scheduleList;
    data["id"] = this.id;
    return data;
  }
}


/// the new one
//
//
//
// class AvailbilityModel {
//   AvailbilityModel({
//     required this.status,
//     required this.message,
//     required this.userId,
//     required this.data,
//   });
//
//   int status;
//   String message;
//   int userId;
//   List<Data> data;
//
//   factory AvailbilityModel.fromJson(Map<String, dynamic> json) => AvailbilityModel(
//     status: json["status"],
//     message: json["message"],
//     userId: json["user_id"],
//     data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "user_id": userId,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class Data {
//   Data({
//     required this.date,
//     required this.scheduleList,
//      required this.id,
//   });
//
//   String date;
//   String scheduleList;
//   int id;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     date: json['date'],
//     scheduleList: json["schedule_list"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "date": date,
//     "schedule_list": scheduleList,
//     "id": id,
//   };
// }
