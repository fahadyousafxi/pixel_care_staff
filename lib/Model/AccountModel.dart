class UserAccountinfo {
  int? status;
  String? message;
  Data? data;
  String? token;

  UserAccountinfo({this.status, this.message, this.data, this.token});

  UserAccountinfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  int? id;
  dynamic name;
  dynamic phone;
  dynamic email;
  dynamic emailOtp;
  dynamic country;
  dynamic hourlyRate;
  dynamic dob;
  dynamic status;
  Null? temporaryBlockStart;
  Null? temporaryBlockEnd;
  Null? type;
  dynamic avatar;
  dynamic nextOfKin;
  dynamic referralId;
  Null? refferBy;
  dynamic isBlocked;
  dynamic role;
  dynamic createdAt;
  dynamic updatedAt;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['email_otp'] = emailOtp;
    data['country'] = country;
    data['hourly_rate'] = hourlyRate;
    data['dob'] = dob;
    data['status'] = status;
    data['temporary_block_start'] = temporaryBlockStart;
    data['temporary_block_end'] = temporaryBlockEnd;
    data['type'] = type;
    data['avatar'] = avatar;
    data['next_of_kin'] = nextOfKin;
    data['referral_id'] = referralId;
    data['reffer_by'] = refferBy;
    data['is_blocked'] = isBlocked;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
