class TimesheetModel {
  int? status;
  String? message;
  Data? data;

  TimesheetModel({this.status, this.message, this.data});

  TimesheetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic businessUnit;
  dynamic staffName;
  dynamic jobPost;
  dynamic jobPostId;
  dynamic shiftId;
  dynamic shiftTime;
  dynamic date;
  dynamic day;

  Data(
      {this.businessUnit,
      this.staffName,
      this.jobPost,
      this.jobPostId,
      this.shiftId,
      this.shiftTime,
      this.date,
      this.day});

  Data.fromJson(Map<String, dynamic> json) {
    businessUnit = json['business_unit'];
    staffName = json['staff_name'];
    jobPost = json['job_post'];
    jobPostId = json['job_post_id'];
    shiftId = json['shift_id'];
    shiftTime = json['shift_time'];
    date = json['date'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['business_unit'] = businessUnit;
    data['staff_name'] = staffName;
    data['job_post'] = jobPost;
    data['job_post_id'] = jobPostId;
    data['shift_id'] = shiftId;
    data['shift_time'] = shiftTime;
    data['date'] = date;
    data['day'] = day;
    return data;
  }
}
