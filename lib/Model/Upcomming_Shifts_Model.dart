class UpcommingShiftsModel {
  UpcommingShiftsModel({
    required this.status,
    required this.message,
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int status;
  String message;
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory UpcommingShiftsModel.fromJson(Map<String, dynamic> json) =>
      UpcommingShiftsModel(
        status: json["status"],
        message: json["message"],
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.careHomeId,
    required this.position,
    required this.title,
    this.image,
    required this.description,
    required this.date,
    required this.jobEndDate,
    this.timeStart,
    this.timeEnd,
    required this.noOfStaff,
    required this.shift,
    this.deleatedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.shiftDetailName,
    required this.careHome,
    required this.careHomeJobApplied,
  });

  int id;
  dynamic careHomeId;
  dynamic position;
  dynamic title;
  dynamic image;
  dynamic description;
  DateTime date;
  DateTime jobEndDate;
  dynamic timeStart;
  dynamic timeEnd;
  dynamic noOfStaff;
  dynamic shift;
  dynamic deleatedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic shiftDetailName;
  CareHome careHome;
  CareHomeJobApplied careHomeJobApplied;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        careHomeId: json["care_home_id"],
        position: json["position"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        jobEndDate: DateTime.parse(json["job_end_date"]),
        timeStart: json["time_start"],
        timeEnd: json["time_end"],
        noOfStaff: json["no_of_staff"],
        shift: json["shift"],
        deleatedAt: json["deleated_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        shiftDetailName: json["shift_detail_name"],
        careHome: CareHome.fromJson(json["care_home"]),
        careHomeJobApplied:
            CareHomeJobApplied.fromJson(json["care_home_job_applied"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "care_home_id": careHomeId,
        "position": position,
        "title": title,
        "image": image,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "job_end_date":
            "${jobEndDate.year.toString().padLeft(4, '0')}-${jobEndDate.month.toString().padLeft(2, '0')}-${jobEndDate.day.toString().padLeft(2, '0')}",
        "time_start": timeStart,
        "time_end": timeEnd,
        "no_of_staff": noOfStaff,
        "shift": shift,
        "deleated_at": deleatedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "shift_detail_name": shiftDetailName,
        "care_home": careHome.toJson(),
        "care_home_job_applied": careHomeJobApplied.toJson(),
      };
}

class CareHome {
  CareHome({
    required this.id,
    required this.groupName,
    required this.name,
    required this.image,
    required this.cityId,
    required this.postalCode,
    required this.address,
    required this.contactNumber,
    required this.managerName,
    required this.managerEmail,
    required this.adminName,
    required this.adminEmail,
    required this.accountantName,
    required this.accountantEmail,
    required this.hourlyRate,
    required this.careHomeRateTypeId,
    this.paymentTerms,
    this.website,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.careHomeUserId,
  });

  int id;
  String groupName;
  String name;
  String image;
  String cityId;
  String postalCode;
  String address;
  String contactNumber;
  String managerName;
  String managerEmail;
  String adminName;
  String adminEmail;
  String accountantName;
  String accountantEmail;
  String hourlyRate;
  String careHomeRateTypeId;
  dynamic paymentTerms;
  dynamic website;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String careHomeUserId;

  factory CareHome.fromJson(Map<String, dynamic> json) => CareHome(
        id: json["id"],
        groupName: json["group_name"],
        name: json["name"],
        image: json["image"],
        cityId: json["city_id"],
        postalCode: json["postal_code"],
        address: json["address"],
        contactNumber: json["contact_number"],
        managerName: json["manager_name"],
        managerEmail: json["manager_email"],
        adminName: json["admin_name"],
        adminEmail: json["admin_email"],
        accountantName: json["accountant_name"],
        accountantEmail: json["accountant_email"],
        hourlyRate: json["hourly_rate"],
        careHomeRateTypeId: json["care_home_rate_type_id"],
        paymentTerms: json["payment_terms"],
        website: json["website"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        careHomeUserId: json["care_home_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_name": groupName,
        "name": name,
        "image": image,
        "city_id": cityId,
        "postal_code": postalCode,
        "address": address,
        "contact_number": contactNumber,
        "manager_name": managerName,
        "manager_email": managerEmail,
        "admin_name": adminName,
        "admin_email": adminEmail,
        "accountant_name": accountantName,
        "accountant_email": accountantEmail,
        "hourly_rate": hourlyRate,
        "care_home_rate_type_id": careHomeRateTypeId,
        "payment_terms": paymentTerms,
        "website": website,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "care_home_user_id": careHomeUserId,
      };
}

class CareHomeJobApplied {
  CareHomeJobApplied({
    required this.id,
    required this.careHomeJobId,
    required this.status,
  });

  int id;
  String careHomeJobId;
  String status;

  factory CareHomeJobApplied.fromJson(Map<String, dynamic> json) =>
      CareHomeJobApplied(
        id: json["id"],
        careHomeJobId: json["care_home_job_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "care_home_job_id": careHomeJobId,
        "status": status,
      };
}

class Link {
  Link({
    this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
