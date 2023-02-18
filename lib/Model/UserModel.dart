// ignore_for_file: file_names

class UserModel {
  int? status;
  String? message;
  Data? data;
  String? token;

  UserModel({this.status, this.message, this.data, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? country;
  String? hourlyRate;
  String? dob;
  String? status;
  String? type;
  String? avatar;
  String? nextOfKin;
  String? isBlocked;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.country,
      this.hourlyRate,
      this.dob,
      this.status,
      this.type,
      this.avatar,
      this.nextOfKin,
      this.isBlocked,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    country = json['country'];
    hourlyRate = json['hourly_rate'];
    dob = json['dob'];
    status = json['status'];
    type = json['type'];
    avatar = json['avatar'];
    nextOfKin = json['next_of_kin'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['country'] = this.country;
    data['hourly_rate'] = this.hourlyRate;
    data['dob'] = this.dob;
    data['status'] = this.status;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['next_of_kin'] = this.nextOfKin;
    data['is_blocked'] = this.isBlocked;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
