class TimesheetModel {
  int? status;
  String? message;
  Data? data;

  TimesheetModel({this.status, this.message, this.data});

  TimesheetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? businessUnit;
  String? staffName;
  String? jobPost;
  int? jobPostId;
  String? shiftId;
  String? shiftTime;
  String? date;
  String? day;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_unit'] = this.businessUnit;
    data['staff_name'] = this.staffName;
    data['job_post'] = this.jobPost;
    data['job_post_id'] = this.jobPostId;
    data['shift_id'] = this.shiftId;
    data['shift_time'] = this.shiftTime;
    data['date'] = this.date;
    data['day'] = this.day;
    return data;
  }
}
