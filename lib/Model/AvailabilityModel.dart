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

  Data({this.date, this.scheduleList});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    scheduleList = json['schedule_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['schedule_list'] = this.scheduleList;
    return data;
  }
}
