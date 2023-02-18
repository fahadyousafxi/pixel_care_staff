class BookingModel {
  int? status;
  String? message;
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  BookingModel(
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
        this.total});

  BookingModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? image;
  String? description;
  String? date;
  String? timeStart;
  String? timeEnd;
  Null? deleatedAt;
  String? createdAt;
  String? updatedAt;
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
        this.careHomeJobApplied});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    careHomeId = json['care_home_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    date = json['date'];
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    deleatedAt = json['deleated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    careHome = json['care_home'] != null
        ? new CareHome.fromJson(json['care_home'])
        : null;
    careHomeJobApplied = json['care_home_job_applied'] != null
        ? new CareHomeJobApplied.fromJson(json['care_home_job_applied'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_id'] = this.careHomeId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time_start'] = this.timeStart;
    data['time_end'] = this.timeEnd;
    data['deleated_at'] = this.deleatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String? action;

  CareHomeJobApplied({this.id, this.careHomeJobId, this.status, this.action});

  CareHomeJobApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    careHomeJobId = json['care_home_job_id'];
    status = json['status'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_job_id'] = this.careHomeJobId;
    data['status'] = this.status;
    data['action'] = this.action;
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
