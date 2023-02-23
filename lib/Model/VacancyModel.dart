class vacancyModel {
  int? status;
  String? message;
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  vacancyModel(
      {this.status,
        this.message,
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total
      });

  vacancyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? careHomeId;
  String? position;
  String? title;
  String? image;
  String? description;
  String? date;
  DateTime? jobEndDate;
  String? timeStart;
  String? timeEnd;
  dynamic noOfStaff;
  String? shift;
  Null? deleatedAt;
  String? createdAt;
  String? updatedAt;
  String? shiftDetailName;
  CareHome? careHome;
  CareHomeJobApplied? careHomeJobApplied;

  Data(
      {this.id,
        this.careHomeId,
        this.title,
        this.image,
        this.description,
        this.date,
        this.timeStart,
        this.timeEnd,
        this.deleatedAt,
        this.createdAt,
        this.updatedAt,
        this.careHome,
        this.careHomeJobApplied,
        this.shift,
        this.shiftDetailName,
        this.noOfStaff,
        this.jobEndDate,
        this.position
      });

  Data.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    careHomeId = json['care_home_id'];
    position = json['position'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    date = json['date'];
    jobEndDate = DateTime.parse(json["job_end_date"]);
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    noOfStaff = json['no_of_staff'];
    shift = json['shift'];
    deleatedAt = json['deleated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shiftDetailName = json['shift_detail_name'];
    careHome = json['care_home'] != null ? new CareHome.fromJson(json['care_home']) : null;
    careHomeJobApplied = json['care_home_job_applied'] != null ? new CareHomeJobApplied.fromJson(json['care_home_job_applied']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_id'] = this.careHomeId;
    data['position'] = this.position;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['date'] = this.date;
    data['job_end_date'] = this.jobEndDate;
    data['time_start'] = this.timeStart;
    data['time_end'] = this.timeEnd;
    data['no_of_staff'] = this.noOfStaff;
    data['shift'] = this.shift;
    data['deleated_at'] = this.deleatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shift_detail_name'] = this.shiftDetailName;
    if (this.careHome != null) {
      data['care_home'] = this.careHome!.toJson();
    }
    if (this.careHomeJobApplied != null) {
      data['care_home_job_applied'] = this.careHomeJobApplied!.toJson();
    }
    return data;
  }
}

class CareHome {
  int? id;
  String? name;
  String? image;
  String? hourlyRate;
  String? status;
  String? createdAt;
  String? updatedAt;

  CareHome(
      {this.id,
        this.name,
        this.image,
        this.hourlyRate,
        this.status,
        this.createdAt,
        this.updatedAt});

  CareHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    hourlyRate = json['hourly_rate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['hourly_rate'] = this.hourlyRate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CareHomeJobApplied {
  int? id;
  String? careHomeJobId;
  String? status;

  CareHomeJobApplied({this.id, this.careHomeJobId, this.status});

  CareHomeJobApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    careHomeJobId = json['care_home_job_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_job_id'] = this.careHomeJobId;
    data['status'] = this.status;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}



// class vacancyModel {
//   int? status;
//   String? message;
//   int? currentPage;
//   List<Data>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Link>? links;
//   dynamic nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//
//   vacancyModel({
//     required this.status,
//     required this.message,
//     required this.currentPage,
//     required this.data,
//     required this.firstPageUrl,
//     required this.from,
//     required this.lastPage,
//     required this.lastPageUrl,
//     required this.links,
//     this.nextPageUrl,
//     required this.path,
//     required this.perPage,
//     this.prevPageUrl,
//     required this.to,
//     required this.total,
//   });
//
//    vacancyModel.fromJson(Map<String, dynamic> json) {
//     // vacancyModel(
//       status = json["status"];
//       message = json["message"];
//       currentPage = json["current_page"];
//       data = List<Data>.from(json["data"].map((x) => Data.fromJson(x)));
//       firstPageUrl = json["first_page_url"];
//       from = json["from"];
//       lastPage = json["last_page"];
//       lastPageUrl = json["last_page_url"];
//       links = List<Link>.from(json["links"].map((x) => Link.fromJson(x)));
//       nextPageUrl = json["next_page_url"];
//       path = json["path"];
//       perPage = json["per_page"];
//       prevPageUrl = json["prev_page_url"];
//       to = json["to"];
//       total = json["total"];
//     // );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "links": List<dynamic>.from(links!.map((x) => x.toJson())),
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }
//
// class Data {
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//   int id;
//   String careHomeId;
//   String position;
//   String title;
//   dynamic image;
//   String description;
//   DateTime date;
//   DateTime jobEndDate;
//   String timeStart;
//   String timeEnd;
//   dynamic noOfStaff;
//   String shift;
//   dynamic deleatedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String shiftDetailName;
//   CareHome careHome;
//   dynamic careHomeJobApplied;
//
//
//   Data({
//     required this.id,
//     required this.careHomeId,
//     required this.position,
//     required this.title,
//     this.image,
//     required this.description,
//     required this.date,
//     required this.jobEndDate,
//     required this.timeStart,
//     required this.timeEnd,
//     this.noOfStaff,
//     required this.shift,
//     this.deleatedAt,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.shiftDetailName,
//     required this.careHome,
//     this.careHomeJobApplied,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     careHomeId: json["care_home_id"],
//     position: json["position"],
//     title: json["title"],
//     image: json["image"],
//     description: json["description"],
//     date: DateTime.parse(json["date"]),
//     jobEndDate: DateTime.parse(json["job_end_date"]),
//     timeStart: json["time_start"],
//     timeEnd: json["time_end"],
//     noOfStaff: json["no_of_staff"],
//     shift: json["shift"],
//     deleatedAt: json["deleated_at"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     shiftDetailName: json["shift_detail_name"],
//     careHome: CareHome.fromJson(json["care_home"]),
//     careHomeJobApplied: json["care_home_job_applied"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "care_home_id": careHomeId,
//     "position": position,
//     "title": title,
//     "image": image,
//     "description": description,
//     "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//     "job_end_date": "${jobEndDate.year.toString().padLeft(4, '0')}-${jobEndDate.month.toString().padLeft(2, '0')}-${jobEndDate.day.toString().padLeft(2, '0')}",
//     "time_start": timeStart,
//     "time_end": timeEnd,
//     "no_of_staff": noOfStaff,
//     "shift": shift,
//     "deleated_at": deleatedAt,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "shift_detail_name": shiftDetailName,
//     "care_home": careHome.toJson(),
//     "care_home_job_applied": careHomeJobApplied,
//   };
// }
//
// class CareHome {
//
//   int id;
//   String groupName;
//   String name;
//   String image;
//   String cityId;
//   String postalCode;
//   String address;
//   String contactNumber;
//   String managerName;
//   String managerEmail;
//   String adminName;
//   String adminEmail;
//   String accountantName;
//   String accountantEmail;
//   String hourlyRate;
//   String careHomeRateTypeId;
//   dynamic paymentTerms;
//   dynamic website;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String careHomeUserId;
//
//   CareHome({
//     required this.id,
//     required this.groupName,
//     required this.name,
//     required this.image,
//     required this.cityId,
//     required this.postalCode,
//     required this.address,
//     required this.contactNumber,
//     required this.managerName,
//     required this.managerEmail,
//     required this.adminName,
//     required this.adminEmail,
//     required this.accountantName,
//     required this.accountantEmail,
//     required this.hourlyRate,
//     required this.careHomeRateTypeId,
//     this.paymentTerms,
//     this.website,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.careHomeUserId,
//   });
//
//
//   factory CareHome.fromJson(Map<String, dynamic> json) => CareHome(
//     id: json["id"],
//     groupName: json["group_name"],
//     name: json["name"],
//     image: json["image"],
//     cityId: json["city_id"],
//     postalCode: json["postal_code"],
//     address: json["address"],
//     contactNumber: json["contact_number"],
//     managerName: json["manager_name"],
//     managerEmail: json["manager_email"],
//     adminName: json["admin_name"],
//     adminEmail: json["admin_email"],
//     accountantName: json["accountant_name"],
//     accountantEmail: json["accountant_email"],
//     hourlyRate: json["hourly_rate"],
//     careHomeRateTypeId: json["care_home_rate_type_id"],
//     paymentTerms: json["payment_terms"],
//     website: json["website"],
//     status: json["status"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     careHomeUserId: json["care_home_user_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "group_name": groupName,
//     "name": name,
//     "image": image,
//     "city_id": cityId,
//     "postal_code": postalCode,
//     "address": address,
//     "contact_number": contactNumber,
//     "manager_name": managerName,
//     "manager_email": managerEmail,
//     "admin_name": adminName,
//     "admin_email": adminEmail,
//     "accountant_name": accountantName,
//     "accountant_email": accountantEmail,
//     "hourly_rate": hourlyRate,
//     "care_home_rate_type_id": careHomeRateTypeId,
//     "payment_terms": paymentTerms,
//     "website": website,
//     "status": status,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "care_home_user_id": careHomeUserId,
//   };
// }
//
// class CareHomeJobApplied {
//   int? id;
//   String? careHomeJobId;
//   String? status;
//
//   CareHomeJobApplied({this.id, this.careHomeJobId, this.status});
//
//   CareHomeJobApplied.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     careHomeJobId = json['care_home_job_id'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['care_home_job_id'] = this.careHomeJobId;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Link {
//   Link({
//     this.url,
//     required this.label,
//     required this.active,
//   });
//
//   String? url;
//   String label;
//   bool active;
//
//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//     url: json["url"],
//     label: json["label"],
//     active: json["active"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "label": label,
//     "active": active,
//   };
// }
