class UserAccountinfo {
  int? status;
  String? message;
  Data? data;
  String? token;

  UserAccountinfo({this.status, this.message, this.data, this.token});

  UserAccountinfo.fromJson(Map<String, dynamic> json) {
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
  String? emailOtp;
  String? country;
  String? hourlyRate;
  String? dob;
  String? status;
  Null? temporaryBlockStart;
  Null? temporaryBlockEnd;
  Null? type;
  String? avatar;
  String? nextOfKin;
  String? referralId;
  Null? refferBy;
  String? isBlocked;
  String? role;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.emailOtp,
      this.country,
      this.hourlyRate,
      this.dob,
      this.status,
      this.temporaryBlockStart,
      this.temporaryBlockEnd,
      this.type,
      this.avatar,
      this.nextOfKin,
      this.referralId,
      this.refferBy,
      this.isBlocked,
      this.role,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    emailOtp = json['email_otp'];
    country = json['country'];
    hourlyRate = json['hourly_rate'];
    dob = json['dob'];
    status = json['status'];
    temporaryBlockStart = json['temporary_block_start'];
    temporaryBlockEnd = json['temporary_block_end'];
    type = json['type'];
    avatar = json['avatar'];
    nextOfKin = json['next_of_kin'];
    referralId = json['referral_id'];
    refferBy = json['reffer_by'];
    isBlocked = json['is_blocked'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_otp'] = this.emailOtp;
    data['country'] = this.country;
    data['hourly_rate'] = this.hourlyRate;
    data['dob'] = this.dob;
    data['status'] = this.status;
    data['temporary_block_start'] = this.temporaryBlockStart;
    data['temporary_block_end'] = this.temporaryBlockEnd;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['next_of_kin'] = this.nextOfKin;
    data['referral_id'] = this.referralId;
    data['reffer_by'] = this.refferBy;
    data['is_blocked'] = this.isBlocked;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
