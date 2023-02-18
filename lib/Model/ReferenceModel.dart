class ReferenceModel {
  int? status;
  String? message;
  List<Data>? data;

  ReferenceModel({this.status, this.message, this.data});

  ReferenceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? name;
  String? jobTitle;
  String? organization;
  String? address;
  String? phoneNumber;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? relation;

  Data(
      {this.id,
        this.userId,
        this.name,
        this.jobTitle,
        this.organization,
        this.address,
        this.phoneNumber,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.relation});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    jobTitle = json['job_title'];
    organization = json['organization'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    relation = json['relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['job_title'] = this.jobTitle;
    data['organization'] = this.organization;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['relation'] = this.relation;
    return data;
  }
}
